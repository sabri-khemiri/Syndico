package com.miaou.config;

import com.miaou.meeting.dao.MeetingDao;
import com.miaou.meeting.dao.MeetingDaoImpl;
import com.miaou.meeting.dao.ResolutionDao;
import com.miaou.meeting.dao.ResolutionDaoImpl;
import com.miaou.message.dao.MessageDao;
import com.miaou.message.dao.MessageDaoImpl;
import com.miaou.news.dao.NewCommentDao;
import com.miaou.news.dao.NewCommentDaoImpl;
import com.miaou.news.dao.NewsDao;
import com.miaou.news.dao.NewsDaoImpl;
import com.miaou.trust.dao.CoOwnershipDao;
import com.miaou.trust.dao.CoOwnershipDaoImpl;
import com.miaou.trust.dao.TrustDao;
import com.miaou.trust.dao.TrustDaoImpl;
import com.miaou.users.dao.AccountDao;
import com.miaou.users.dao.AccountDaoImpl;
import com.miaou.works.dao.WorksDao;
import com.miaou.works.dao.WorksDaoImpl;
import com.miaou.works.dao.WorksRequestDao;
import com.miaou.works.dao.WorksRequestDaoImpl;
import java.io.IOException;
import java.util.Locale;
import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableWebMvc
@Configuration
@ComponentScan({"com.miaou.*"})
@EnableTransactionManagement
@Import({SecurityConfig.class})
public class AppConfig extends WebMvcConfigurerAdapter{

    @Bean(name = "sessionFactory")
    public LocalSessionFactoryBean sessionFactory() throws IOException {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setPackagesToScan(new String[]{"com.miaou.users.model", "com.miaou.trust.model", "com.miaou.meeting.model", "com.miaou.works.model", "com.miaou.news.model","com.miaou.message.model"});
        sessionFactory.setHibernateProperties(getHibernateProperties());
        sessionFactory.afterPropertiesSet();
        return sessionFactory;
    }

    private Properties getHibernateProperties() {
        Properties prop = new Properties();
        prop.put("hibernate.format_sql", "true");
        prop.put("hibernate.show_sql", "true");
        prop.put("hibernate.hbm2ddl.auto", "update");
        prop.put("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        return prop;
    }

    @Bean(name = "dataSource")
    public BasicDataSource dataSource() {

        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/test");
        ds.setUsername("root");
        return ds;
    }

    @Bean
    public HibernateTransactionManager transactionManager(SessionFactory s) {
        HibernateTransactionManager txManager = new HibernateTransactionManager();
        txManager.setSessionFactory(s);
        return txManager;
    }

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/pages/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Override
    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }

    @Autowired
    @Bean(name = "accountDao")
    public AccountDao getAccountDao(SessionFactory sessionFactory) {
        return new AccountDaoImpl(sessionFactory);
    }

    @Autowired
    @Bean(name = "trustDao")
    public TrustDao getTrustDao(SessionFactory sessionFactory) {
        return new TrustDaoImpl(sessionFactory);
    }
    
    @Autowired
    @Bean(name = "coOwnershipDao")
    public CoOwnershipDao getCoOwnershipDao(SessionFactory sessionFactory) {
        return new CoOwnershipDaoImpl(sessionFactory);
    }
    
    @Autowired
    @Bean(name = "meetingDao")
    public MeetingDao getMeetingDao(SessionFactory sessionFactory) {
        return new MeetingDaoImpl(sessionFactory);
    }

    @Autowired
    @Bean(name = "resolutionDao")
    public ResolutionDao getResolutionDao(SessionFactory sessionFactory) {
        return new ResolutionDaoImpl(sessionFactory);
    }
    
    @Autowired
    @Bean(name = "messageDao")
    public MessageDao getMessageDao(SessionFactory sessionFactory) {
        return new MessageDaoImpl(sessionFactory);
    }
    
    @Autowired
    @Bean(name = "worksDao")
    public WorksDao getWorksDao(SessionFactory sessionFactory) {
        return new WorksDaoImpl(sessionFactory);
    }
    
    @Autowired
    @Bean(name = "worksRequestDao")
    public WorksRequestDao getWorksRequestDao(SessionFactory sessionFactory) {
        return new WorksRequestDaoImpl(sessionFactory);
    }
    
    @Autowired
    @Bean(name = "newsDao")
    public NewsDao getNewsDao(SessionFactory sessionFactory) {
        return new NewsDaoImpl(sessionFactory);
    }
    
    @Autowired
    @Bean(name = "newCommentDao")
    public NewCommentDao getNewCommentDao(SessionFactory sessionFactory) {
        return new NewCommentDaoImpl(sessionFactory);
    }
    
    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasename("/resources/text/message");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }
    @Bean
    public LocaleResolver localeResolver(){
	CookieLocaleResolver resolver = new CookieLocaleResolver();
	resolver.setDefaultLocale(new Locale("fr"));
	resolver.setCookieName("myLocaleCookie");
	resolver.setCookieMaxAge(4800);
	return resolver;
    }
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
	LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
	interceptor.setParamName("lang");
	registry.addInterceptor(interceptor);
    }

    
}
