
brew install tomcat@7

Configuration files: /usr/local/etc/tomcat@7

# tomcat@7 is keg-only, which means it was not symlinked into /usr/local,
# because this is an alternate version of another formula.

# If you need to have tomcat@7 first in your PATH, run:
  echo 'export PATH="/usr/local/opt/tomcat@7/bin:$PATH"' >> ~/.zshrc


# To start tomcat@7:
brew services start tomcat@7
# Or, if you don't want/need a background service you can just run:
  /usr/local/opt/tomcat@7/bin/catalina run

#   Install tomcat finished


# 2. Open <Tomcat>/conf/context.xml and add this inside the <Context> xml element:
        # /usr/local/Cellar/tomcat@7/7.0.109_1
        # /usr/local/etc/tomcat@7/context.xml

<ResourceLink global="jdbc/titan1DataSourceRead" name="jdbc/titan1DataSourceRead" type="javax.sql.DataSource"/>
<ResourceLink global="jdbc/titan1DataSourceUpdate" name="jdbc/titan1DataSourceUpdate" type="javax.sql.DataSource"/>
 
<ResourceLink global="jdbc/supplierXmlDataSourceRead" name="jdbc/supplierXmlDataSourceRead" type="javax.sql.DataSource"/>
<ResourceLink global="jdbc/supplierXmlDataSourceUpdate" name="jdbc/supplierXmlDataSourceUpdate" type="javax.sql.DataSource"/>
 
<Environment name="WEB_SEARCH_PROPERTIES" value="file:${CATALINA_HOME}/webapps/web-search-api.properties" type="java.lang.String" />
<Environment name="SUPPLIER_ADAPTER_PROPERTIES" value="file:${CATALINA_HOME}/webapps/supplier-adapter.properties" type="java.lang.String" />
<Environment name="BACKEND_SERVICE_PROPERTIES" value="file:${CATALINA_HOME}/webapps/backend-service-api.properties" type="java.lang.String" />
<Environment name="PRE_BOOK_SEARCH_PROPERTIES" value="file:${CATALINA_HOME}/webapps/pre-book-search.properties" type="java.lang.String" />


# For the code above to work, make sure you have the Tomcat home directory set in your ~/.bash_profile, for example:

export CATALINA_HOME=/usr/local/opt/tomcat@7/libexec


# 3. Open <Tomcat>/conf/server.xml and add this inside the <GlobalNamingResources> xml element:

<Resource auth="Container" driverClassName="com.mysql.jdbc.Driver"
          factory="org.apache.tomcat.jdbc.pool.DataSourceFactory" 
          maxActive="500" maxIdle="10"
          minIdle="5" name="jdbc/titan1DataSourceRead" password="supplier_xml"
          testOnBorrow="true"
          type="javax.sql.DataSource"
          url="jdbc:mysql://update-dev-crbms.db.traveljigsaw.com:3306/titan1?useConfigs=maxPerformance&amp;useServerPrepStmts=true&amp;allowMultiQueries=true&amp;rewriteBatchedStatements=true&amp;autoReconnect=true&amp;useUnicode=yes&amp;characterEncoding=UTF-8"
          username="supplier_xml" validationQuery="SELECT 1"/>
 
<Resource auth="Container" driverClassName="com.mysql.jdbc.Driver"
          factory="org.apache.tomcat.jdbc.pool.DataSourceFactory" initialSize="5"
          maxActive="10" maxIdle="10"
          minIdle="10" name="jdbc/supplierXmlDataSourceRead" password="supplier_xml"
          testOnBorrow="true"
          type="javax.sql.DataSource"
          url="jdbc:mysql://localhost:3306/supplier_xml?useConfigs=maxPerformance&amp;useServerPrepStmts=true&amp;allowMultiQueries=true&amp;rewriteBatchedStatements=true&amp;autoReconnect=true&amp;useUnicode=yes&amp;characterEncoding=UTF-8"
          username="supplier_xml" validationQuery="SELECT 1" validationQueryTimeout="1"/>

#   4. Open <Tomcat>/conf/tomcat-users.xml and add this inside the <tomcat-users> xml element:

<user username="supplier_xml" password="supplier_xml" roles="manager-gui,manager-script, manager-status, manager-jmx"/>




 mv ~/Downloads/rabbit.properties $CATALINA_HOME/lib                                                          64 ✘
 mv ~/Downloads/mysql-connector-java-8.0.23.jar $CATALINA_HOME/lib                                               ✔
 mv ~/Downloads/slf4j-api-1.7.12.jar $CATALINA_HOME/lib