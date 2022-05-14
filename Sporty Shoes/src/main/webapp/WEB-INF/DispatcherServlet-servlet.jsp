<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xmlns:tx="http://www.springframework.org/schema/tx"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="
        http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd
        http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd">

   <context:component-scan base-package="org.sporty_shoes.controller"/>

	<mvc:annotation-driven/>
	
   <bean class = "org.springframework.web.servlet.view.InternalResourceViewResolver">
      <property name = "prefix" value = "/WEB-INF/view/" />
      <property name = "suffix" value = ".jsp" />
   </bean>

	<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName" value="com.mysql.cj.jdbc.Driver"></property>
		<property name="url" value="jdbc:mysql://localhost:3306/sporty_shoes"></property>
		<property name="username" value="root"></property>
		<property name="password" value="admin"></property>
	</bean>
	
	<bean id="sessionFactory"  class="org.springframework.orm.hibernate5.LocalSessionFactoryBean">  
        <property name="dataSource" ref="dataSource"></property>  
        <property name="packagesToScan" value="org.sporty_shoes.model"></property>   
        <property name="hibernateProperties">  
            <props>  
                <prop key="hibernate.dialect">org.hibernate.dialect.MySQL8Dialect</prop>  
                <prop key="hibernate.hbm2ddl.auto">update</prop>  
                <prop key="hibernate.show_sql">true</prop>  
            </props>  
        </property>  
    </bean>
    
   <bean id="myTransactionManager" class="org.springframework.orm.hibernate5.HibernateTransactionManager">
		<property name="sessionFactory" ref="sessionFactory"/>
	</bean>

	<tx:annotation-driven transaction-manager="myTransactionManager"/>
    
    <bean id="hibernateTemplate" class="org.springframework.orm.hibernate5.HibernateTemplate">  
    <property name="sessionFactory" ref="sessionFactory"></property>  
    </bean>  
      
    <bean id="adminRepository" class="org.sporty_shoes.repository.AdminRepository">  
    <property name="hibernateTemplate" ref="hibernateTemplate"></property>  
    </bean> 
    
    <bean id="productRepository" class="org.sporty_shoes.repository.ProductRepository">  
    <property name="hibernateTemplate" ref="hibernateTemplate"></property>  
    </bean>
    
    <bean id="userRepository" class="org.sporty_shoes.repository.UserRepository">  
    <property name="hibernateTemplate" ref="hibernateTemplate"></property>  
    </bean>
    
    <bean id="purchaseReportRepository" class="org.sporty_shoes.repository.PurchaseReportRepository">  
    <property name="hibernateTemplate" ref="hibernateTemplate"></property>  
    </bean>
    
    <bean id="repository" class="org.sporty_shoes.repository.Repository">  
    <property name="hibernateTemplate" ref="hibernateTemplate"></property>  
    </bean>
    
</beans>