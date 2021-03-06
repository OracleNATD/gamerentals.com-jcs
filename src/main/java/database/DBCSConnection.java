package database;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

import oracle.jdbc.pool.*;

import javax.servlet.ServletContext;

/*
 *
 * @author 
 */
public class DBCSConnection {


    //Database Connection properties
    private String dbUser = null;
    private String dbPass = null;
    private String dbIP = null;
    private String dbName = null;
    private String source = null;

    //DB Connection objects
    private Connection _conn;
    private final OracleDataSource _ords;


    public DBCSConnection(ServletContext context) throws SQLException {

        // Get database connection information from the system properties...
        dbUser = System.getProperty("dbUser");
        dbPass = System.getProperty("dbPass");
        dbIP = System.getProperty("dbIP");
        dbName = System.getProperty("dbName");
        setSource("system properties");
        
        // If the system properties are not set, look to the OS environment...        
        if (dbUser == null || dbPass == null || dbIP == null || dbName == null) {
            System.out.println("[DB DEBUG] The database connection information wasn't provided via system properties - checking the OS environment.");
            // This will allow an individual system property to override the properties file...
            dbUser = (dbUser != null) ? dbUser : System.getenv("dbUser");
            dbPass = (dbPass != null) ? dbPass : System.getenv("dbPass");
            dbIP = (dbIP != null) ? dbIP : System.getenv("dbIP");
            dbName = (dbName != null) ? dbName : System.getenv("dbName");
            setSource("OS environment");
        }

        // If the environment it not set, pull from a Maven generated properties file...
        if (dbUser == null || dbPass == null || dbIP == null || dbName == null) {
            System.out.println("[DB DEBUG] The database connection information wasn't provided via system properties or the OS environment - reading from Maven generarated db.proerties file.");

            try {
                String dbPropsRelpath = "db.properties";
                System.out.println("[DB DEBUG] Servlet Context: " + context);
                InputStream propStream = context.getResourceAsStream(dbPropsRelpath);
                Properties dbProps = new Properties();
                dbProps.load(propStream);
                // This will allow an individual system property or environment variable to override the properties file...
                dbUser = (dbUser != null) ? dbUser : dbProps.getProperty("databaseUser");
                dbPass = (dbPass != null) ? dbPass : dbProps.getProperty("databasePassword");
                dbIP = (dbIP != null) ? dbIP : dbProps.getProperty("databaseIP");
                dbName = (dbName != null) ? dbName : dbProps.getProperty("databaseName");
                setSource("Maven generated db.properties file");
            } catch (IOException e) {
                System.out.println("[DB DEBUG] Error loading database connection info");
            }
        }

        String connURL = "jdbc:oracle:thin:@//" + dbIP + ":1521/" + dbName;
        //Create Data Source
        _ords = new OracleDataSource();
        _ords.setURL(connURL);
        _ords.setUser(dbUser);
        _ords.setPassword(dbPass);
        _conn = _ords.getConnection();
        _conn = DriverManager.getConnection(connURL, dbUser, dbPass);

    }
    
    private void setSource(String connSource) {
        
        System.out.println("[DB DEBUG] The following are the database connection properties after reading from the " + connSource);
        System.out.println("[DB DEBUG] Database User:" + dbUser);
        System.out.println("[DB DEBUG] Database Password:" + dbPass);
        System.out.println("[DB DEBUG] Database IP:" + dbIP);
        System.out.println("[DB DEBUG] Database Name:" + dbName);
        
        // If any of these have been set, consider it the primary source of 
        // connection information
        if (dbUser != null || dbPass != null || dbIP != null || dbName != null) {
            // Once source has been set, assume that's the primary...
            source = (source != null) ? source : connSource;
        }            
    }

    public Connection getConnection() throws SQLException {
        //Lazy Initialization
        boolean newConn = false;
        
        if (_conn == null) {
            System.out.println("Database connection doesn't exist.");
            _conn = _ords.getConnection();
            newConn = true;
            System.out.println("New database connection established.");
        }

        if (_conn.isClosed()) {
            System.out.println("Connection is closed.");
            _conn = _ords.getConnection();
            newConn = true;
            System.out.println("New database connection established.");
        }
        
        if (!newConn) {
            System.out.println("Using existing database connection");
        }
        
        return _conn;
    }

    public boolean isActive() throws SQLException {
        return !_conn.isClosed();
    }
    

    /**
     * @return the dbUser
     */
    public String getDbUser() {
        return dbUser;
    }

    /**
     * @param dbUser the dbUser to set
     */
    public void setDbUser(String dbUser) {
        this.dbUser = dbUser;
    }

    /**
     * @return the dbPass
     */
    public String getDbPass() {
        return dbPass;
    }

    /**
     * @param dbPass the dbPass to set
     */
    public void setDbPass(String dbPass) {
        this.dbPass = dbPass;
    }

    /**
     * @return the dbIP
     */
    public String getDbIP() {
        return dbIP;
    }

    /**
     * @param aDbIP the dbIP to set
     */
    public void setDbIP(String aDbIP) {
        dbIP = aDbIP;
    }

    /**
     * @return the dbName
     */
    public String getDbName() {
        return dbName;
    }

    /**
     * @param aDbName the dbName to set
     */
    public void setDbName(String aDbName) {
        dbName = aDbName;
    }    

    /**
     * @return the source of the database connection information
     */
    public String getSource() {
        return source;
    }

}
