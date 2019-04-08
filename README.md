# MVVMProtocol
MVVM模版协议
为了可以使项目更加规范的使用整个框架，定义了一套MVVM的协议

## MVVM
![Image text](https://github.com/HobiSpace/MVVMProtocol/blob/master/ReadMeResources/MVVMArc.png)

## 协议解析

### MVVM_ViewCtonroller
定义Controller层，用于管理生命周期，View的代理，以及View和VM的绑定调用
### MVVM_View
定义View层，用于UI展示，绑定对应的VM

### MVVM_ViewModel
定义ViewModel层，业务逻辑，数据转换
#### MVVM_ViewModel_Interface
提供给View层或者Controller层调用的接口
#### MVVM_ViewModel_Data_Bind
提供给View进行绑定更新的协议

### MVVM_Model
定义Model层
#### MVVM_Model_Interface
提供给ViewModel进行调用接口
