using ImagoMundi.Helpers;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Connections
{
    public class DBConnection
    {
        private static SqlConnection CONNECTION;

        private DBConnection()
        {
        }

        private static SqlConnection getConnection()
        {
            if (CONNECTION == null)
            {
                try
                {
                    CONNECTION = initializeConnection();
                }
                catch (SqlException)
                {
                }
            }
            return CONNECTION;
        }

        private static SqlConnection initializeConnection()
        {

            return new SqlConnection(AppSettings.Instance.DbConnectionString);
        }

        public static SqlCommand getSqlCommandFromQuery(String query)
        {

            if (CONNECTION == null || CONNECTION.State == System.Data.ConnectionState.Closed )
            {
                DBConnection.getConnection().Open();
            }
            SqlCommand command = DBConnection.getConnection().CreateCommand();
            command.CommandText = query;

            return command;
        }

        public static void CloseSqlConnection()
        {
            CONNECTION.Close();
        }
    }
}

