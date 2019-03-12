package com.infotop.utils;

/*
 * Created  on 2018/7/23 14:06.
 * 作者: Dengjiabin
 * 说明:代码生成器，生成mapper.xml->dao->service->serviceImpl->controller所有代码
 */

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;


public class CustomGenerator{
	public static void main(String[] args) {
		AutoGenerator autoGenerator = new AutoGenerator();
		System.out.println("开始执行==");
		//全局配置
		GlobalConfig globalConfig = new GlobalConfig();
		String projectPath = System.getProperty("user.dir");
		globalConfig.setOutputDir(projectPath + "/src/main/java");
		globalConfig.setFileOverride(true);
//		globalConfig.setActiveRecord(true);
		globalConfig.setEnableCache(false);// XML 二级缓存
		globalConfig.setBaseResultMap(true);// XML ResultMap
		globalConfig.setBaseColumnList(true);// XML columList
		globalConfig.setAuthor("Dengjb");
		//生成文件名:
		globalConfig.setXmlName("%sMapper");
		globalConfig.setMapperName("%sMapper");
		globalConfig.setServiceName("%sService");
		globalConfig.setServiceImplName("%sServiceImpl");
		globalConfig.setControllerName("%sController");

		autoGenerator.setGlobalConfig(globalConfig);

		// 数据源配置
		DataSourceConfig dataSourceConfig = new DataSourceConfig();
		dataSourceConfig.setDbType(DbType.MYSQL);
//		dataSourceConfig.setTypeConvert(new MySqlTypeConvert(){
//			// 自定义数据库表字段类型转换【可选】
//			@Override
//			public DbColumnType processTypeConvert(String fieldType) {
//				return super.processTypeConvert(fieldType);
//			}
//		});
		dataSourceConfig.setDriverName("com.mysql.jdbc.Driver");
		dataSourceConfig.setUsername("root");
		dataSourceConfig.setPassword("123456");
		dataSourceConfig.setUrl("jdbc:mysql://127.0.0.1:3306/circle?characterEncoding=utf8&useSSL=false");
		autoGenerator.setDataSource(dataSourceConfig);

		// 策略配置
		StrategyConfig strategyConfig = new StrategyConfig();
//        strategyConfig.setCapitalMode(true);    // 全局大写命名 ORACLE 注意
//		strategyConfig.setTablePrefix(new String[] { "yj_", "gy_", "d_", "t", "h_"});// 此处可以修改为您的表前缀
		strategyConfig.setNaming(NamingStrategy.underline_to_camel);
//		strategyConfig.setInclude(new String[] { "gy_user" }); // 需要生成的表
		// strategy.setExclude(new String[]{"test"}); // 排除生成的表
		// 自定义实体父类
		// strategy.setSuperEntityClass("com.baomidou.demo.TestEntity");
		// 自定义实体，公共字段
		// strategy.setSuperEntityColumns(new String[] { "test_id", "age" });
		// 自定义 mapper 父类
		// strategy.setSuperMapperClass("com.baomidou.demo.TestMapper");
		// 自定义 service 父类
		// strategy.setSuperServiceClass("com.baomidou.demo.TestService");
		// 自定义 service 实现类父类
		// strategy.setSuperServiceImplClass("com.baomidou.demo.TestServiceImpl");
		// 自定义 controller 父类
		// strategy.setSuperControllerClass("com.baomidou.demo.TestController");
		// 【实体】是否生成字段常量（默认 false）
		// public static final String ID = "test_id";
		// strategy.setEntityColumnConstant(true);
		// 【实体】是否为构建者模型（默认 false）
		// public User setName(String name) {this.name = name; return this;}
		// strategy.setEntityBuliderModel(true);
		autoGenerator.setStrategy(strategyConfig);

		// 包配置
		PackageConfig packageConfig = new PackageConfig();
		packageConfig.setParent("com.boot.rsquality");
		packageConfig.setController("controller");
		packageConfig.setMapper("dao");
		packageConfig.setXml("mapper");
		autoGenerator.setPackageInfo(packageConfig);



		// 执行生成
		autoGenerator.execute();

		// 打印注入设置【可无】
//		System.err.println(autoGenerator.getCfg().getMap().get("abc"));
	}


}
