import mysql from 'mysql2/promise';
import dbConfig from './config/db.config.js';  // Adjust the path

const grantAdminAccess = async (username) => {
    const connection = await mysql.createConnection(dbConfig.database);
    try {
        await connection.execute(
            'UPDATE users SET isAdmin = true WHERE username = ?',
            [username]
        );
        console.log(`Admin access granted to user: ${username}`);
    } catch (error) {
        console.error('Error granting admin access:', error);
    } finally {
        await connection.end();
    }
};

// Replace 'desiredUsername' with the actual username you want to grant admin access to
grantAdminAccess('desiredUsername');
