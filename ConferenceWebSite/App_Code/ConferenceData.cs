using Oracle.DataAccess.Client;
using System;
using System.Configuration;
using System.Data;
using System.Windows.Forms;

namespace ConferenceWebsite.App_code
{
    //**********************************************************
    //* THE CODE IN THIS CLASS CANNOT BE MODIFIED OR ADDED TO. *
    //*        Report problems to 3311rep@cse.ust.hk.          *
    //**********************************************************

    public class ConferenceData
    {
        // Set the connection string to connect to the University database.
        OracleConnection ConferenceDBConnection = new OracleConnection(ConfigurationManager.ConnectionStrings["ConferenceConnectionString"].ConnectionString);

        // Process a SQL SELECT statement.
        public DataTable GetData(string sql)
        {
            try
            {
                if (sql.Trim() == "")
                {
                    throw new ArgumentException("The SQL statement is empty.");
                }

                DataTable dt = new DataTable();
                if (ConferenceDBConnection.State != ConnectionState.Open)
                {
                    ConferenceDBConnection.Open();
                    OracleDataAdapter da = new OracleDataAdapter(sql, ConferenceDBConnection);
                    da.Fill(dt);
                    ConferenceDBConnection.Close();
                }
                else
                {
                    OracleDataAdapter da = new OracleDataAdapter(sql, ConferenceDBConnection);
                    da.Fill(dt);
                }
                return dt;
            }
            catch (ArgumentException ex)
            {
                MessageBox.Show(ex.Message);
            }

            catch (OracleException ex)
            {
                MessageBox.Show(ex.Message);
            }
            return null;
        }

        // Process an SQL SELECT statement that returns only a single value.
        // Returns 0 if the table is empty or the column has no values.
        public decimal GetAggregateValue(string sql)
        {
            try
            {
                if (sql.Trim() == "")
                {
                    throw new ArgumentException("The SQL statement is empty.");
                }
                object aggregateValue;
                if (ConferenceDBConnection.State != ConnectionState.Open)
                {
                    ConferenceDBConnection.Open();
                    OracleCommand SQLCmd = new OracleCommand(sql, ConferenceDBConnection);
                    SQLCmd.CommandType = CommandType.Text;
                    aggregateValue = SQLCmd.ExecuteScalar();
                    ConferenceDBConnection.Close();
                }
                else
                {
                    OracleCommand SQLCmd = new OracleCommand(sql, ConferenceDBConnection);
                    SQLCmd.CommandType = CommandType.Text;
                    aggregateValue = SQLCmd.ExecuteScalar();
                }
                return (DBNull.Value == aggregateValue ? 0 : Convert.ToDecimal(aggregateValue));
            }
            catch (ArgumentException ex)
            {
                MessageBox.Show(ex.Message);
            }
            catch (OracleException ex)
            {
                MessageBox.Show(ex.Message);
            }
            return -1;
        }

        // Process SQL INSERT, UPDATE and DELETE statements.
        public void SetData(string sql, OracleTransaction trans)
        {
            try
            {
                if (sql.Trim() == "")
                {
                    throw new ArgumentException("The SQL statement is empty.");
                }

                OracleCommand SQLCmd = new OracleCommand(sql, ConferenceDBConnection);
                SQLCmd.Transaction = trans;
                SQLCmd.CommandType = CommandType.Text;
                SQLCmd.ExecuteNonQuery();
            }
            catch (ArgumentException ex)
            {
                ConferenceDBConnection.Close();
                MessageBox.Show(ex.Message);
            }
            catch (ApplicationException ex)
            {
                ConferenceDBConnection.Close();
                MessageBox.Show(ex.Message);
            }
            catch (OracleException ex)
            {
                ConferenceDBConnection.Close();
                MessageBox.Show(ex.Message);
            }
            catch (InvalidOperationException ex)
            {
                ConferenceDBConnection.Close();
                MessageBox.Show(ex.Message);
            }
        }

        public OracleTransaction BeginTransaction()
        {
            if (ConferenceDBConnection.State != ConnectionState.Open)
            {
                ConferenceDBConnection.Open();
                OracleTransaction trans = ConferenceDBConnection.BeginTransaction();
                return trans;
            }
            else
            {
                OracleTransaction trans = ConferenceDBConnection.BeginTransaction();
                return trans;
            }
        }

        public void CommitTransaction(OracleTransaction trans)
        {
            try
            {
                if (ConferenceDBConnection.State == ConnectionState.Open)
                {
                    trans.Commit();
                    ConferenceDBConnection.Close();
                }
            }
            catch (ApplicationException ex)
            {
                MessageBox.Show(ex.Message);
            }
            catch (OracleException ex)
            {
                MessageBox.Show(ex.Message);
            }
            catch (InvalidOperationException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public int GetNextPersonId()
        {
            // Get the next available person id by selecting the maximum current person id and adding 1.
            decimal maxPersonId = GetAggregateValue("select max(person_id) from person");
            // Check whether this is the first person being added to the database.
            if (maxPersonId == -1)
            {
                MessageBox.Show("Error getting person id. \n Please contact 3311 Rep.");
            }
            return Convert.ToInt32(maxPersonId + 1);
        }
    }
}