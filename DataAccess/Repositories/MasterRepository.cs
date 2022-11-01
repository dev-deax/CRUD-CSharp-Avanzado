using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories
{
    abstract class MasterRepository:Repository
    {
        protected List<SqlParameter> parameters;
        protected int ExecNonQuery(string transactSQL) {
            using (var connection=GetConnection())
            {
                connection.Open();
                using (var commad=new SqlCommand()) {
                    commad.Connection = connection;
                    commad.CommandText = transactSQL;
                    commad.CommandType = CommandType.Text;
                    foreach (SqlParameter parameter in parameters)
                    {
                        commad.Parameters.Add(parameter);
                    }
                    int result = commad.ExecuteNonQuery();
                }
            }
        }
        protected DataTable ExecNonQuery(string transactSQL) { }


    }
}
