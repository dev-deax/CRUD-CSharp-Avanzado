﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories
{
    abstract class Repository
    {
        private readonly string connectionString;

        public Repository()
        {
            connectionString = ConfigurationManager.ConnectionStrings["Presentacion.Properties.Settings.connDB_CS"].ToString();
        }
        protected SqlConnection GetConnection()
        {
            return new SqlConnection(connectionString); 
        }
    }
}