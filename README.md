# MVVMProtocol
MVVM模版协议
为了可以使项目更加规范的使用整个框架，定义了一套MVVM的协议

## MVVM
![Image text](https://github.com/HobiSpace/MVVMProtocol/blob/master/ReadMeResources/MVVMArc.png)

## 协议解析

* **MVVM_ViewCtonroller** 
定义Controller层，用于管理生命周期，View的代理，以及View和VM的绑定调用

* **MVVM_View**
定义View层，用于UI展示，绑定对应的VM

* **MVVM_ViewModel**
定义ViewModel层，业务逻辑，数据转换

    * MVVM_ViewModel_Data_Bind
    提供给View进行绑定更新的协议
    * MVVM_ViewModel_Reformer
    提供ViewModel转化Model的功能
    
* **MVVM_Model**
定义Model层，提供给ViewModel进行绑定和转化

## 命名规范

模块名 Module

前缀 Pre

xxx 看具体业务

* **Model层**

    * Model实例(Json对应的MapperObject)
    Pre+Module+xxx+Model
    * DataManager(DB,网络拉取数据提供原始数据)
    Pre+Module+xxx+DataManager

* **ViewModel层**
Pre+Module+xxx+ViewModel

* **View层**
Pre+Module+xxx+View(对应的View类型)

* **Controllrer层**
Pre+Module+xxx+Controller


## 模版安装


```
cd 到本目录工程目录/sh
sh install.sh
```

在新建文件下会有个Custom目录

* ViewController 模版
* MVVMViewController 模版
* MVVMViewModel 模版
* MVVMView 模版
* MVVModel 模版



