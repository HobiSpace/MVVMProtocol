//
//  React.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/4/4.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

/// 响应式变量
public class React<T> {
    
    /// 变量更新回调
    public typealias Listener = (T) -> Void
    
    /// 内部变量
    private var value: T {
        didSet {
            for subscriber in subscribers {
                subscriber.innerListener(value)
            }
        }
    }
    
    /// 订阅者数组
    private var subscribers: [Subscriber<Listener>] = []
    
    /// 初始化方法
    ///
    /// - Parameter value: 监听变量
    public init(_ value: T) {
        self.value = value
    }
    
    /// 绑定监听事件
    ///
    /// - Parameter listener: 监听事件回调
    /// - Returns: 销毁者
    public func bind(_ listener: Listener?) -> Dispose? {
        guard let tmpListener = listener else {
            return nil
        }
        
        let dispose = Dispose.init()
        let subscriber = Subscriber<Listener>.init(listener: tmpListener, dispose: dispose)
        subscribers.append(subscriber)
        subscriber.disposeCallBack = { [weak self] (disposeSubscriber) in
            self?.subscribers.removeAll(where: { (tmpSub) -> Bool in
                if disposeSubscriber == tmpSub {
                    return true
                }
                return false
            })
        }
        return dispose
    }
    
    /// 绑定监听事件并且马上执行
    ///
    /// - Parameter listener: 监听事件回调
    /// - Returns: 销毁者
    public func bindAndFire(_ listener: Listener?) -> Dispose? {
        guard let tmpListener = listener else {
            return nil
        }

        let dispose = Dispose.init()
        let subscriber = Subscriber<Listener>.init(listener: tmpListener, dispose: dispose)
        subscribers.append(subscriber)
        subscriber.disposeCallBack = { [weak self] (disposeSubscriber) in
            self?.subscribers.removeAll(where: { (tmpSub) -> Bool in
                if disposeSubscriber == tmpSub {
                    return true
                }
                return false
            })
        }
        listener?(value)
        return dispose
    }
    
    /// 更新值
    ///
    /// - Parameter value: 新值
    public func update(_ value: T) {
        self.value = value
    }
}

/// 订阅者
public class Subscriber<L>: NSObject {
    
    fileprivate var innerListener: L
    fileprivate var dispose: Dispose
    fileprivate var disposeCallBack: ((Subscriber?) -> Void)?
    
    /// 初始化方法
    ///
    /// - Parameters:
    ///   - listener: 监听事件
    ///   - dispose: 销毁者
    public init(listener: L, dispose: Dispose) {
        self.innerListener = listener
        self.dispose = dispose
        super.init()
        dispose.disposeClosure = { [weak self] in
            self?.disposeCallBack?((self))
        }
    }
}

/// 销毁者
public class Dispose: NSObject {
    
    public typealias DisposeClosure = (() -> Void)
    
    fileprivate var disposeClosure: DisposeClosure?
    
    /// 初始化方法
    ///
    /// - Parameter disposeClosure: 销毁回调
    public init(with disposeClosure: DisposeClosure? = nil) {
        self.disposeClosure = disposeClosure
    }
    
    /// 销毁
    public func dispose() {
        disposeClosure?()
    }
    
}
