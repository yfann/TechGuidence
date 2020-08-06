


## load class
+ `org.springframework.boot.loader.Launcher` 启动spring boot
    + jar包中META-INF/MANIFEST.MF
        + Main-Class:org.springframework.boot.loader.Launcher
            - Launcher会调用启动类中的main()
        + Start-Class:启动类(包含main())
    + 子类
        - jarLauncher
        - WarLauncher
        - PropertiesLauncher
            + 可以添加外部依赖

## ref
+ [spring boot应用启动原理分析](https://blog.csdn.net/hengyunabc/article/details/50120001)
+ [SpringBoot Jar启动](https://blog.csdn.net/BryantLmm/article/details/86305047)