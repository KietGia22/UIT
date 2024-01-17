using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Cau1
{
    class Program
    {

        public static void TruyVan1()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;
                try
                {
                    sql = @"Update Products set UnitsInStock = 20 where UnitsInStock =0 ";
                    cmd.CommandText = sql;
                    cmd.ExecuteNonQuery();
                    Console.WriteLine("\nCập nhật thành công!");
                } 
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            } 
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }
        
        public static void TruyVan2()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;
                try
                {
                    sql = @"update Products set UnitPrice = UnitPrice + (UnitPrice*0.1) where UnitsOnOrder > 20 ";
                    cmd.CommandText = sql;
                    cmd.ExecuteNonQuery();
                    Console.WriteLine("\nCập nhật thành công!");
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message) ;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan3()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select ProductName from Products where ProductName like 'G%' ";
                cmd.CommandText = sql;
                var read = cmd.ExecuteReader();
                if (read.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nCác sản phẩm có tên bắt đầu bằng G:");
                        Console.WriteLine("ProductName:");
                        while (read.Read())
                        {
                            var PName = read.GetString(0);
                            Console.WriteLine($"{PName}");
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine (ex.Message) ;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan4()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"select ProductName from Products p join Suppliers s on p.SupplierID = s.SupplierID where s.CompanyName = 'Tokyo Traders'";
                cmd.CommandText = sql;
                var reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                   try
                    {
                        Console.WriteLine("\nCác sản phẩm của công ty Tokyo Traders cung cấp: ");
                        Console.WriteLine("ProductName: ");
                        while (reader.Read())
                        {
                            var PName = reader.GetString(0);
                            Console.WriteLine($"{PName}");
                        }
                    } 
                    catch (Exception ex)
                    {
                        Console.WriteLine (ex.Message) ;
                    }
                } 
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan5()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"select ContactName from Customers where City = 'Berlin'";
                cmd.CommandText = sql;
                var reader5 = cmd.ExecuteReader();
                if (reader5.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nCác khách hàng ở Berlin: ");
                        Console.Write("ContactName: ");
                        while (reader5.Read())
                        {
                            var CName = reader5.GetString(0);
                            Console.WriteLine($"{CName}");
                        }
                    } 
                    catch (Exception ex)
                    {
                        Console.WriteLine (ex.Message) ;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan6()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select ProductID, ProductName from Products pr, Categories ct  where pr.CategoryID = ct.CategoryID and CategoryName = 'Meat/Poultry'";
                cmd.CommandText = sql;
                var reader6 = cmd.ExecuteReader();
                if (reader6.HasRows)
                {
                    Console.WriteLine("\ncác Products của CategoryName = “Meat/Poultry”: ");
                    Console.WriteLine("ProductID \tProductName: ");
                    while (reader6.Read())
                    {
                        try
                        {
                            var ProductID = reader6.GetInt32(0);
                            var ProductName = reader6.GetString(1);
                            Console.WriteLine($"\t{ProductID} \t{ProductName}");
                        }
                        catch(Exception ex) { 
                            Console.WriteLine (ex.Message) ;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan7()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select OrderDate, ShipName from Orders where ShipCountry = 'Germany'";
                cmd.CommandText = sql;
                var reader7 = cmd.ExecuteReader();
                if (reader7.HasRows)
                {
                    Console.WriteLine("\nCác order được ship đến ShipCountry là 'Germany': ");
                    Console.WriteLine("OrderDate    \t\tShipName: ");
                    while (reader7.Read())
                    {
                        try
                        {
                            var OrderDate = reader7.GetDateTime(0);
                            var ShipName = reader7.GetString(1);
                            Console.WriteLine($"{OrderDate} \t{ShipName}");
                        } catch(Exception ex)
                        {
                            Console.WriteLine (ex.Message) ;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan8()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select ProductID, ProductName from Products where UnitsOnOrder = 0";
                cmd.CommandText = sql;
                var reader8 = cmd.ExecuteReader();
                if (reader8.HasRows)
                {
                    Console.WriteLine("\nCác product chưa được đặt hàng: ");
                    Console.WriteLine("ProductID: \tProductName:");
                    while (reader8.Read())
                    {
                        try
                        {
                            var ProductID = reader8.GetInt32(0);
                            var ProductName = reader8.GetString(1);
                            Console.WriteLine($"\t{ProductID}  \t{ProductName}");
                        } catch(Exception ex)
                        {
                            Console.WriteLine (ex.Message) ;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan9()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select CompanyName, ContactName, ProductName, UnitPrice, UnitsInStock from Products pr, Suppliers sp where pr.SupplierID = sp.SupplierID Group By CompanyName, ContactName, ProductName, UnitPrice, UnitsInStock Having Count(ProductID) >= 10";
                cmd.CommandText = sql;
                var reader9 = cmd.ExecuteReader();
                if (reader9.HasRows)
                {
                    Console.WriteLine("\ncác Supplier cung cấp 10 Product trở lên: ");
                    while (reader9.Read())
                    {
                        try
                        {
                            var CompanyName = reader9.GetString(0);
                            var ContactName = reader9.GetString(1);
                            var ProductName = reader9.GetString(2);
                            var UnitPrice = reader9.GetInt32(3);
                            var UnitsInStock = reader9.GetInt32(4);
                            Console.WriteLine($"{CompanyName} \t{ContactName} \t{ProductName} \t{UnitPrice} \t{UnitsInStock}");
                        }
                        catch(Exception ex)
                        {
                            Console.WriteLine (ex.Message) ;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan10()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select ProductName, UnitPrice, UnitsInStock from Products where UnitsInStock > 0 AND ProductID NOT IN (SELECT ProductID FROM dbo.[Order Details])";
                cmd.CommandText = sql;
                var reader10 = cmd.ExecuteReader();
                if (reader10.HasRows)
                {
                    Console.WriteLine("\nLiệt kê các Products chưa được bán (ProductName, UnitPrice, UnitsInStock): ");
                    while (reader10.Read())
                    {
                        try
                        {
                            var ProductName = reader10.GetString(0);
                            var UnitPrice = reader10.GetInt32(1);
                            var UnitsInStock = reader10.GetInt32(2);
                            Console.WriteLine($"{ProductName} \t {UnitPrice} \t {UnitsInStock}");
                        } catch (Exception ex)
                        {
                            Console.WriteLine (ex.Message) ;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan11()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select CompanyName from Suppliers LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID where Products.ProductID IS NULL";
                cmd.CommandText = sql;
                var reader11 = cmd.ExecuteReader();
                if (reader11.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nCác Supplier (CompanyName) chưa cung cấp Product nào: ");
                        while (reader11.Read())
                        {
                            var CompanyName = reader11.GetString(0);
                            Console.WriteLine($"{CompanyName}");
                        }
                    } catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan12()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select Sum((UnitPrice * Quantity * (1 - Discount))) AS Revenue from dbo.[Order Details] od, Orders ors where od.OrderID = ors.OrderID and YEAR(OrderDate) = 1996";
                cmd.CommandText = sql;
                var reader12 = cmd.ExecuteReader();
                if (reader12.HasRows)
                {
                    try
                    {
                        Console.Write("\nDoanh thu năm 1996: ");
                        while (reader12.Read())
                        {
                            var Revenue = reader12.GetDouble(0);
                            Console.WriteLine($"{Revenue}");
                        }
                    } catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan13()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select CategoryName, Count(pr.ProductID) AS QuantityPro from Categories ct,Products pr where ct.CategoryID = pr.CategoryID Group By CategoryName Order By QuantityPro DESC";
                cmd.CommandText = sql;
                var reader13 = cmd.ExecuteReader();
                if (reader13.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nSố Product của từng Category: ");
                        Console.WriteLine("CategoryName: \tQuantityPro: ");
                        while (reader13.Read())
                        {
                            var CategoryName = reader13.GetString(0);
                            var QuantityPro = reader13.GetInt32(1);
                            Console.WriteLine($"{CategoryName} \t{QuantityPro}");
                        }
                    }
                    catch(Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan14()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select CompanyName, Count(pr.ProductID) AS QuantityPro from Suppliers sp,Products pr where sp.SupplierID = pr.SupplierID Group By CompanyName Order By QuantityPro DESC";
                cmd.CommandText = sql;
                var reader14 = cmd.ExecuteReader();
                if (reader14.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nSố Product của từng Supplier: ");
                        Console.WriteLine("\t\tCompanyName: \t\tQuantityPro:");
                        while (reader14.Read())
                        {
                            var CompanyName = reader14.GetString(0);
                            var QuantityPro = reader14.GetInt32(1);
                            Console.WriteLine($"{CompanyName, 35} \t{QuantityPro}");
                        }
                    }
                    catch(Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan15()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select Top 1 CustomerID, OrderDate,  Max((UnitPrice * Quantity * (1 - Discount))) AS MaxTotal from dbo.[Order Details] od, Orders ors where od.OrderID = ors.OrderID Group By CustomerID, OrderDate ORDER BY MaxTotal DESC";
                cmd.CommandText = sql;
                var reader15 = cmd.ExecuteReader();
                if (reader15.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nOrder (CustomerID, OrderDate) có trị giá (UnitPrice * Quantity và Discount) lớn nhất:: ");
                        Console.WriteLine("CustomerID: \tOrderDate: \t\tMaxTotal:");
                        while (reader15.Read())
                        {
                            var CustomerID = reader15.GetString(0);
                            var OrderDate = reader15.GetDateTime(1);
                            var MaxTotal = reader15.GetSqlSingle(2);
                            Console.WriteLine($"{CustomerID} \t\t{OrderDate} \t{MaxTotal}");
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan16()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select Top 1 ContactName, Max((od.UnitPrice * Quantity * (1 - Discount))) AS MaxTotal from Customers cs, Orders ors, [Order Details] od where cs.CustomerID = ors.CustomerID and od.OrderID = ors.OrderID Group By ContactName ORDER BY MaxTotal DESC";
                cmd.CommandText = sql;
                var reader16 = cmd.ExecuteReader();
                if (reader16.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nCustomer (ContactName) có Order có trị giá cao nhất: ");
                        Console.WriteLine("ContatctName: \tMaxTotal:");
                        while (reader16.Read())
                        {
                            var ContactName = reader16.GetString(0);
                            var MaxTotal = reader16.GetSqlSingle(1);
                            Console.WriteLine($"{ContactName} \t{MaxTotal}");
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan17()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"SELECT ContactName, COUNT(OrderID) AS Quantity FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID GROUP BY Customers.ContactName ORDER BY Quantity DESC";
                cmd.CommandText = sql;
                var reader17 = cmd.ExecuteReader();
                if (reader17.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nĐếm số lần mua hàng của Customer (ContactName, Quantity): ");
                        Console.WriteLine("\tContactName:    \t\tQuantity: ");
                        while (reader17.Read())
                        {
                            var ContactName = reader17.GetString(0);
                            var Quantity = reader17.GetInt32(1);
                            Console.WriteLine($"{ContactName,25} \t\t{Quantity}");
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan18()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"SELECT TOP 1 ContactName, COUNT(OrderID) AS Quantity FROM Customers cs JOIN Orders ors ON cs.CustomerID = ors.CustomerID GROUP BY ContactName ORDER BY Quantity DESC";
                cmd.CommandText = sql;
                var reader18 = cmd.ExecuteReader();
                if (reader18.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nCustomer (ContactName) có số lần mua hàng nhiều nhất: ");
                        Console.WriteLine("ContactName: \tQuantity: ");
                        while (reader18.Read())
                        {
                            var ContactName = reader18.GetString(0);
                            var Quantity = reader18.GetInt32(1);
                            Console.WriteLine($"{ContactName} \t{Quantity}");
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan19()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"SELECT LastName, FirstName from Employees em LEFT JOIN Orders ors ON em.EmployeeID = ors.EmployeeID where OrderID IS NULL";
                cmd.CommandText = sql;
                var reader19 = cmd.ExecuteReader();
                if (reader19.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nTìm Employee chưa lập Order nào: ");
                        Console.WriteLine("LastName \tFirstName: ");
                        while (reader19.Read())
                        {
                            var LastName = reader19.GetString(0);
                            var FirstName = reader19.GetString(1);
                            Console.WriteLine($"{LastName} \t{FirstName}");
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }
                else
                {
                    Console.WriteLine("Không tìm thấy dữ liệu thoả mãn điều kiện");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan20()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"SELECT ProductName, SUM(od.Quantity) AS Quantity FROM Products pr JOIN [Order Details] od ON pr.ProductID = od.ProductID"
                                   + " JOIN Orders ors ON od.OrderID = ors.OrderID WHERE YEAR(OrderDate) = 1996 GROUP BY ProductName ORDER BY Quantity DESC";
                cmd.CommandText = sql;
                var reader20 = cmd.ExecuteReader();
                if (reader20.HasRows)
                {
                    int oke = 0;
                    try
                    {
                        Console.WriteLine("\nTính tổng số lượng bán ra của mỗi Product (ProductName, Quantity) trong năm 1996: ");
                        Console.WriteLine("\t\tProductName: \t\t\tQuantity: ");
                        while (reader20.Read())
                        {
                            var ProductName = reader20.GetString(0);
                            var Quantity = reader20.GetInt32(1);
                            Console.WriteLine($"{ProductName, 40} \t{Quantity}");
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan21()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"Select CompanyName, City from Suppliers Group by City, CompanyName";
                cmd.CommandText = sql;
                var reader21 = cmd.ExecuteReader();
                if (reader21.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nLiệt kê Supplier theo từng City (CompanyName): ");
                        Console.WriteLine("City: \t\tCompanyName: ");
                        while (reader21.Read())
                        {
                            var CompanyName = reader21.GetString(0);
                            var City = reader21.GetString(1);
                            Console.WriteLine($"{City, 10} \t{CompanyName}");
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan22()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;
                sql = @"SELECT TOP 3 ContactName, SUM(od.UnitPrice * Quantity * (1 - Discount)) AS Sales
                                    FROM Customers cs JOIN Orders ors ON cs.CustomerID = ors.CustomerID 
                                    JOIN [Order Details] od ON ors.OrderID = od.OrderID
                                    GROUP BY ContactName ORDER BY Sales DESC";
                cmd.CommandText = sql;
                var reader22 = cmd.ExecuteReader();
                if (reader22.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nCho biết 3 Customer có doanh số cao nhất (ContactName, Sales): ");
                        Console.WriteLine("ContactName: \tSales: ");
                        while (reader22.Read())
                        {
                            var ContactName = reader22.GetString(0);
                            var Sales = reader22.GetDouble(1);
                            Console.WriteLine($"{ContactName} \t{Sales}");
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan23()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"SELECT 
                                        DATEPART(MONTH, OrderDate) AS SalesMonth,
                                        SUM(od.UnitPrice * Quantity * (1 - Discount)) AS TotalSales
                                    FROM Orders ors
                                    JOIN [Order Details] od ON ors.OrderID = od.OrderID
                                    WHERE YEAR(OrderDate) = 1996
                                    GROUP BY DATEPART(YEAR, OrderDate), DATEPART(MONTH, OrderDate)
                                    ORDER BY SalesMonth";
                cmd.CommandText = sql;
                var reader23 = cmd.ExecuteReader();
                if (reader23.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nTính doanh thu của từng Product trong năm 1996: ");
                        Console.WriteLine("SalesMonth: \tTotalSales: ");
                        while (reader23.Read())
                        {
                            var SalesMonth = reader23.GetInt32(0);
                            var TotalSales = reader23.GetDouble(1);
                            Console.WriteLine($"{SalesMonth,10} \t{TotalSales}");
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan24()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;
                sql = @"SELECT ProductName, SUM(od.UnitPrice * Quantity * (1 - Discount)) AS TotalRevenue FROM Products pr
                                    JOIN [Order Details] od ON pr.ProductID = od.ProductID JOIN Orders ors ON od.OrderID = ors.OrderID
                                    WHERE YEAR(OrderDate) = 1996 GROUP BY ProductName ORDER BY TotalRevenue DESC ";
                cmd.CommandText = sql;
                var reader24 = cmd.ExecuteReader();
                if (reader24.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nTính doanh thu của từng Product trong năm 1996: ");
                        Console.WriteLine("\t\tProductName: \t\tTotalRevenue: ");
                        while (reader24.Read())
                        {
                            var ProductName = reader24.GetString(0);
                            var TotalRevenue = reader24.GetDouble(1);
                            Console.WriteLine($"{ProductName, 35} \t{TotalRevenue}");
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan25()
        {
            var conString = @"Data Source= localhost; Initial Catalog= LAB3; Integrated Security= True";
            var connection = new SqlConnection
            {
                ConnectionString = conString
            };
            try
            {
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    Console.WriteLine("Connection opened succesfully!");
                }
                string sql;
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                sql = @"SELECT ShipCountry AS country, SUM(Freight) AS sales FROM Orders GROUP BY ShipCountry";
                cmd.CommandText = sql;
                var reader25 = cmd.ExecuteReader();
                if (reader25.HasRows)
                {
                    try
                    {
                        Console.WriteLine("\nTính tổng số tiền vận chuyển hàng (Freight - Order) đến từng nước: ");
                        Console.WriteLine("   Country: \tSales: ");
                        while (reader25.Read())
                        {
                            var country = reader25.GetString(0);
                            var sales = reader25.GetDecimal(1);
                            Console.WriteLine($"{country,10} \t{sales}");
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.Unicode;
            while (true)
            {
                int c;
                Console.WriteLine("=============Menu============="
                    + "\n0. Thoát."
                    + "\n1. Cập nhật UnitsInStock thành 20 đối với những Product đang có UnitsInStock = 0."
                    + "\n2. Tăng UnitPrice lên 10% đối với những Products đã được bán trên 20 lần."
                    + "\n3. Liệt kê các Product (ProductName) có ProductName bắt đầu bằng chữ “G”."
                    + "\n4. Liệt kê các Product (ProductName) do CompanyName “Tokyo Traders” cung cấp."
                    + "\n5. Liệt kê các Customer (ContactName) ở City là “Berlin”."
                    + "\n6. Liệt kê tất cả các Products (ProductID, ProductName) của CategoryName = 'Meat/Poultry'."
                    + "\n7. Liệt kê tất cả các Order (OrderDate, ShipName) được ship đến ShipCountry là 'Germany'."
                    + "\n8. Liệt kê các Product (ProductID, ProductName) chưa được đặt hàng (UnitsOnOrder=0)."
                    + "\n9. Liệt kê các Supplier (CompanyName, ContactName) cung cấp 10 Product trở lên (ProductName, UnitPrice, UnitsInStock)."
                    + "\n10. Liệt kê các Products chưa được bán (ProductName, UnitPrice, UnitsInStock)."
                    + "\n11. Liệt kê các Supplier (CompanyName) chưa cung cấp Product nào."
                    + "\n12. Tính doanh thu năm 1996."
                    + "\n13. Đếm số Product của từng Category (CatagoryName, QuantityPro)."
                    + "\n14. Đếm số Product của từng Supplier (CompanyName, QuantityPro)."
                    + "\n15. Cho biết Order (CustomerID, OrderDate) có trị giá (UnitPrice * Quantity và Discount) lớn nhất."
                    + "\n16. Cho biết Customer (ContactName) có Order có trị giá cao nhất."
                    + "\n17. Đếm số lần mua hàng của Customer (ContactName, Quantity)."
                    + "\n18. Tìm Customer (ContactName) có số lần mua hàng nhiều nhất."
                    + "\n19. Tìm Employee chưa lập Order nào."
                    + "\n20. Tính tổng số lượng bán ra của mỗi Product (ProductName, Quantity) trong năm 1996."
                    + "\n21. Liệt kê Supplier theo từng City (CompanyName)."
                    + "\n22. Cho biết 3 Customer có doanh số cao nhất (ContactName, Sales)."
                    + "\n23. Tính doanh số bán hàng của từng tháng trong năm 1996."
                    + "\n24. Tính doanh thu của từng Product trong năm 1996."
                    + "\n25. Tính tổng số tiền vận chuyển hàng (Freight - Order) đến từng nước.");

                do
                {
                    Console.Write("\nNhập lựa chọn của bạn: ");
                    c = Int32.Parse(Console.ReadLine());
                    if (c < 0 || c > 25)
                        Console.WriteLine("Vui lòng nhập lại");
                } while (c < 0 || c > 25);

                if (c == 0)
                    break;

                switch (c)
                {
                    case 1:
                        TruyVan1();
                        break;

                    case 2:
                        TruyVan2();
                        break;

                    case 3:
                        TruyVan3();
                        break;

                    case 4:
                        TruyVan4();
                        break;

                    case 5:
                        TruyVan5();
                        break;

                    case 6:
                        TruyVan6();
                        break;

                    case 7:
                        TruyVan7();
                        break;


                    case 8:
                        TruyVan8();
                        break;

                    case 9:
                        TruyVan9();
                        break;

                    case 10:
                        TruyVan10();
                        break;

                    case 11:
                        TruyVan11();
                        break;

                    case 12:
                        TruyVan12();
                        break;

                    case 13:
                        TruyVan13();
                        break;

                    case 14:
                        TruyVan14();
                        break;

                    case 15:
                        TruyVan15();
                        break;

                    case 16:
                        TruyVan16();
                        break;

                    case 17:
                        TruyVan17();
                        break;

                    case 18:
                        TruyVan18();
                        break;

                    case 19:
                        TruyVan19();
                        break;

                    case 20:
                         TruyVan20();
                        break;

                    case 21:
                        TruyVan21();
                        break;

                    case 22:
                        TruyVan22();
                        break;

                    case 23:
                        TruyVan23();
                        break;

                    case 24:
                        TruyVan24();
                        break;

                    case 25:
                        TruyVan25();
                        break;
                }

                Console.WriteLine("\n Nhan Enter de tiep tuc");
                Console.ReadLine();
                Console.Clear();
            }
        }

    }
}
