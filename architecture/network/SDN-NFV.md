
## SDN vs NFV
+ SDN and NFV make networking architectures more flexible and dynamic
+ they both use network abstraction
    + depend heavily on virtualization
+ SDN and NFV differ in how they separate functions and abstract resources.


## SDN(oftware-defined networking)
+ SDN abstracts physical networking resources –switches, routers and so on – and moves decision making to a virtual network control plane. In this approach, the control plane decides where to send traffic, while the hardware continues to direct and handle the traffic.
+ SDN将控制和转发分离，能实现网络L2～L7层功能的灵活部署、管理和监控调度，实现流量的灵活调度。即实现的是网络资源的管理、调度。
+ SDN executes on an NFV infrastructure
    + NFV provides basic networking functions
    + SDN controls and orchestrates them for specific uses
      + routing
      + policy definition
+ SDN further allows configuration and behavior to be programmatically defined and modified

## NFV(network functions virtualization )
+  NFV aims to virtualize all physical network resources beneath a hypervisor, which allows the network to grow without the addition of more devices.
+ NFV将硬件和软件解耦，让网络L2～L7层的功能（防火墙，交换机等）从专有硬件中解放出来，让其能在通用的虚拟设备（vm／容器／微内核）等上运行。实现的是网络资源的池化
+
## ref
+ [SDN vs NFV](https://www.cisco.com/c/en/us/solutions/software-defined-networking/sdn-vs-nfv.html)