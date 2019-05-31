>### 在Angular中使用服务,首先根据需要的功能,写一个服务类(angular中称为provider),然后将该服务类注册到注入器中(应用启动时自动创建),之后就可以在组件类或其他服务中通过Angular的依赖注入系统使用了,Angular会自动将该类实例化,并处>理好依赖关系.
>
>在Angular中有很多方式可以将服务类注册到注入器中:
>
>+ @Injectable 元数据中的providedIn属性
>+ @NgModule 元数据中的 providers属性
>+ @Component 元数据中的 providers属性
>不同的注册方式,生成的服务也有所不同.
>
>+ 在服务类的 @Injectable 装饰器中:
>//service
>@Injectable({
>    providedIn: 'root',
>})
>providedIn: 'root' 告诉 Angular在根注入器中注册这个服务,这也是使用CLI生成服务时默认的方式.
>这种方式注册,不需要再@NgModule装饰器中写providers,而且在代码编译打包时,可以执行摇树优化，会移除所有没在应用中使用过的服务。推荐使用此种方式注册服务.
>+ 在模块@NgModule 中的 providers
>//service
>@Injectable()
>//module
>@NgModule({
>    providers: [
>        UserService,
>        { provide: APP_CONFIG, useValue: HERO_DI_CONFIG }
>    ],
>})
>这种方式注册,可以对服务进行一些额外的配置(服务类中也需要写@Injectable()装饰器).
>+ 在组件 @Component 中的 providers
>@Component({
>selector: 'app-heroes',
>providers: [ HeroService ]
>这种方式注册,会注册到每个组件实例自己的注入器上。(多个组件会有多个注入器)
>不提供服务类
>最常见的图纸是class,但是在配置providers: []时,也可以不提供服务类,而是返回对象的工厂函数,或是对象字面量[{ provide: Logger, useClass: Logger }]
>也可以使用useValue属性直接交付一个对象实例,[{ provide: Logger, useValue: silentLogger }]