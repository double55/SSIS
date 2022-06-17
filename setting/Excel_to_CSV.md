public void Main()
		{
            // TODO: Add your code here
            // User::varFilePathCSV,User::varFilePathExcel,User::varSheetName
            string FilePathCSV = Dts.Variables["User::varFilePathCSV"].Value.ToString();

            string FilePathExcel = Dts.Variables["User::varFilePathExcel"].Value.ToString();

            string SheetName = Dts.Variables["User::varSheetName"].Value.ToString();

            ExcelToCSV(FilePathExcel, FilePathCSV, SheetName);

            Dts.TaskResult = (int)ScriptResults.Success;
		}

public static void ExcelToCSV(string FilePathExcel, string FilePathCSV, string SheetName)
        {
            // string strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + sourceFile + ";Extended Properties="" Excel.0;HDR=Yes;IMEX=1""";
            string strConn = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 XML; HDR = YES"";", FilePathExcel);

            OleDbConnection conn = null;

            StreamWriter wrtr = null;

            DataSet ds = new DataSet();

            OleDbCommand cmd = null;

            OleDbDataAdapter da = null;
            try
            {
                conn = new OleDbConnection(strConn);

                // MessageBox.Show("ExcelConnec"+" "+conn);
                string Query = string.Format("SELECT * FROM [{0}]", SheetName);

                conn.Open();

                cmd = new OleDbCommand(Query, conn)
                {
                    CommandType = CommandType.Text
                };

                // MessageBox.Show("Cmd" + " " + cmd);

                wrtr = new StreamWriter(FilePathCSV);

                // MessageBox.Show("wrtr" + " " + wrtr);

                da = new OleDbDataAdapter(Query, conn);

                // MessageBox.Show("Da" + " " + da);

                da.Fill(ds);

                DataTable dt = ds.Tables[0];

                // MessageBox.Show("Dt" + " " + dt);

                for (int x = 0; x < dt.Rows.Count; x++)

                {
                    // MessageBox.Show("x=" + " " + x);
                    string rowString = "";

                    for (int y = 0; y < dt.Columns.Count; y++)

                    {
                        // MessageBox.Show("y=" + " " + y);
                        rowString += dt.Rows[x][y].ToString() + ",";

                    }

                    // MessageBox.Show("String" + " " + rowString);

                    wrtr.WriteLine(rowString);

                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                if (conn.State == ConnectionState.Open)

                    conn.Close();

                conn.Dispose();

                cmd.Dispose();

                da.Dispose();

                wrtr.Close();

                wrtr.Dispose();
            }
        }