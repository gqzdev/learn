## SSM+Bootstrap+Vue开发在线学习系统

> 本课题的主要内容是开发基于Java EE的在线学习平台，使用MVC经典开发模式、Java EE的框架     SSM（Spring+SpringMVC+Mybatis）等相关技术开发网站系统。

![](https://images.gitee.com/uploads/images/2019/1202/155719_6d7aa09c_1134592.png)

        使用的开发环境是以MyEclipse为开发环境，采用Tomcat服务器作为Web应用容器，并应用MySQL为系统的数据库管理。
    
        在MVC模式中，应用程序被划分成了模型（Model）、视图（View）和控制器（Controller）三个部分。其中，模型部分包含了应用程序的业务逻辑和业务数据；视图部分封装了应用程序的输出形式，也就是通常所说的页面或者是界面；而控制器部分负责协调模型和视图，根据用户请求来选择要调用哪个模型来处理业务，以及最终由哪个视图为用户做出应答。
    
       模型层（Model）主要完成业务的逻辑处理以及数据的存储。包括业务流程、状态处理及业务规则的处理。业务逻辑接收视图层的请求数据，并返回最终的处理结果。数据模型是实体对象的数据保存，实现了视图层和模型层之间的交互。视图层（View）主要是进行用户和系统的交互，展示用户 所需要的 数据，主要是界面，包括输入和输出。一般可采用JSP、HTML页面、XML等技术实现。一个应用程序可以有很多不同的应用视图，MVC模式只进行视图上数据的采集及处理，及用户的请求，而不在视图上进行业务流程的处理，而是由模型层来处理这些业务流程及状态的改变。
    
        系统是使用到以下的核心Java EE技术。
    
        1)Spring
    
        Spring是一个开源框架，Spring是于2003 年兴起的一个轻量级的Java 开发框架，由Rod Johnson 在其著作Expert One-On-One J2EE Development and Design中阐述的部分理念和原型衍生而来。它是为了解决企业应用开发的复杂性而创建的。Spring使用基本的JavaBean来完成以前只可能由EJB完成的事情。然而，Spring的用途不仅限于服务器端的开发。从简单性、可测试性和松耦合的角度而言，任何Java应用都可以从Spring中受益。 简单来说，Spring是一个轻量级的控制反转(IoC)和面向切面(AOP)的容器框架。
    
        2)Spring MVC
    
        Spring MVC属于SpringFrameWork的后续产品，已经融合在Spring Web Flow里面。Spring MVC 分离了控制器、模型对象、分派器以及处理程序对象的角色，这种分离让它们更容易进行定制。
    
        3)MyBatis
    
        MyBatis是一个基于Java的持久层框架。iBATIS提供的持久层框架包括SQL Maps和Data Access Objects(DAO)MyBatis 消除了几乎所有的JDBC代码和参数的手工设置以及结果集的检索。MyBatis 使用简单的 XML或注解用于配置和原始映射，将接口和 Java 的POJOs(Plain Old Java Objects，普通的 Java对象)映射成数据库中的记录。

![](https://images.gitee.com/uploads/images/2019/1202/155719_8b5f642f_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155720_cf124e98_1134592.png)

 

项目运行说明书

![](https://images.gitee.com/uploads/images/2019/1202/155720_6cf3fee4_1134592.png)

**Eclipse，MyEclipse，IDEA**开发工具都可快速导入启动！！ 

![](https://images.gitee.com/uploads/images/2019/1202/155719_1e834d15_1134592.png)

### 1. 论文章节结构

![](https://images.gitee.com/uploads/images/2019/1202/155719_03f7d0cf_1134592.png)![](https://images.gitee.com/uploads/images/2019/1202/155719_b9abe652_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155719_b95efa94_1134592.jpeg)

![](https://images.gitee.com/uploads/images/2019/1202/155719_3449c291_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155719_6141b5ad_1134592.png)

##部分内容节选

在线学习平台主要分为三大功能模块：系统管理员模块、教师模块和学生模块。如图2-1所示。

![](https://images.gitee.com/uploads/images/2019/1202/155720_7b3e5477_1134592.png)

> 管理员模块：每一个应用系统都需要这样的一个角色，它能保证系统能够在动态中稳定运行，管理系统各种配置属性，即拥护最高的权限。具体功能如下：

学院管理：对学院这个实体进行添加、删除、查询、修改等操作。

课程管理：对课程这个实体进行添加、删除、查询、修改等操作。课程应该归属指定的学院。

教师管理：对教师信息进行管理，包括添加、删除、查询、修改。同时可以通过excel表格批量导入教师信息。

学生管理：对学生信息进行管理，包括添加、删除、查询、修改。同时可以通过excel表格批量导入学生信息。

课程资料管理：对教师上传的课程视频、文档进行管理。

考试管理：可以对教师发布的考试进行管理。

论坛管理：对师生之间的讨论信息进行管理。

公告管理：对在线学习平台的全局公告进行管理。 

### 2. 系统类图设计

从在线学习平台的需求分析中大致可以分析出一些类，但是还不能全面的分析出系统中的实体类。考虑著名的MVC模式，我们需要识别实体、控制和边界三种对象。按照MVC模式来为识别对象做指导，是非常好的做法。对象识别的结果，就是我们所需要的静态模型，通常表现为类图。这个过程使用UML建模技术，将系统中的类结构描绘出来。

首先识别出实体对象，这些对象是比较容易看出来的，例如系统中的角色（管理员、教师、学生）。根据现实世界，角色应该有姓名、性别、电话号码、身份证等属性。系统角色类图如图3-1所示。                                                                         

在线学习平台中的学院、课程、课件等实体类。其中课程应该归属某一个学院的，并且课件的应该是属于某一个课程，由教师上传。课件可以由学生登录平台进行在线观看和下载，其中path字段存储文件的路径。其类图如图3-2所示：                                     除了上面这些实体类，还有一些通知类。系统公告，是所有的登录用户都可以看到的。教师可以发布课程的问题让学生参与其中讨论，这样就需要一个讨论的实体类discuss。有些实体对象需要稍微分析一下才能得到，例如，在在线学习平台中，为了记录学生对教师发布的讨论进行回复，这时就需要一个对象来专门记录这一信息（Discuss_post实体）。其类图如图3-3所示：
    
在线学习平台还有一个在线测试的功能，教师发布考试并且添加试题同时给出试题的正确答案。学生登录系统后，可以在线完成测试，系统自动给该生打分。这样一个功能的完成，需要的实体类有task（考试）、task_question（试题详细）、student_task(学生成绩)。其类图如图3-4所示：

![](https://images.gitee.com/uploads/images/2019/1202/155720_4fc22073_1134592.png)

### 3. 系统文件介绍

![](https://images.gitee.com/uploads/images/2019/1202/155720_ca6c39b2_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155720_7b9f03c0_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155720_592f73fd_1134592.png)

 

 

### 4. 项目结构

![](https://images.gitee.com/uploads/images/2019/1202/155719_bb282f69_1134592.png)

###  5. 部分功能演示：

![](https://images.gitee.com/uploads/images/2019/1202/155720_a78bf1e7_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155720_d2f110b8_1134592.png)

                                                                                     图5-12  考试信息列表

![](https://images.gitee.com/uploads/images/2019/1202/155720_657169d7_1134592.png)

                                                                                       图5-13  试题信息

![](https://images.gitee.com/uploads/images/2019/1202/155720_54a4ebd6_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155720_477a65cb_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155720_d9a71ec3_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155720_223be21d_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155720_0944285a_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155720_2121b7ca_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155720_9fa7df54_1134592.png)

![](https://images.gitee.com/uploads/images/2019/1202/155720_cd647d91_1134592.png)

| 项目开发技术路线1 | Spring+Spring MVC +MyBatis+JSP |
| ----------------- | ------------------------------ |
| 项目开发技术路线2 | Spring+Spring MVC+MyBatis+Vue  |

【[系统在线演示](http://ganquanzhong.top/learn)】 [test](http://ganquanzhong.top/index/test/)   [ Reward](http://ganquanzhong.top/index/Reward.html)

 **项目需求联系：2027776292** 