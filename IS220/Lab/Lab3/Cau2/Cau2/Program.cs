using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace Cau2
{
    class Program
    {
        private static Lab3DataContext db = new Lab3DataContext("Database=Lab3;Server=localhost;Integrated Security=true");

        private static int variables = 0;

        public static void TruyVan1()
        {
            try
            {
                var updPro = from pro in db.Products
                             where pro.UnitsInStock == 0
                             select pro;
                foreach (var product in updPro)
                {
                    product.UnitsInStock = 20;
                }

                var result = db.GetChangeSet();
                db.SubmitChanges();

                Console.WriteLine($"Updated {result.Updates.Count} rows");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan2()
        {
            try {
                var updPro = from pro in db.Products
                             where pro.UnitsOnOrder > 20
                             select pro;

                foreach (var product in updPro)
                {
                    product.UnitPrice = product.UnitPrice * 1.1m;
                }

                var result = db.GetChangeSet();
                db.SubmitChanges();
                Console.WriteLine($"Updated {result.Updates.Count} rows");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan3()
        {
            try {
                variables = 0;

                Console.WriteLine("3. Liệt kê các Product (ProductName) có ProductName bắt đầu bằng chữ “G”.");

                var query = (from pro in db.Products
                             where pro.ProductName.StartsWith("G")
                             select new
                             {
                                 TenSP = pro.ProductName
                             }).ToList();

                Console.WriteLine("Sản phẩm có chữ cái bắt đầu bằng 'G' là: ");

                Console.WriteLine("\t| STT |        ProductName           |");

                foreach (var product in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {product.TenSP,-28} |");
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
            try
            {
                variables = 0;

                Console.WriteLine("4. Liệt kê các Product (ProductName) do CompanyName “Tokyo Traders” cung cấp..");

                var query = (
                        from p in db.Products
                        join s in db.Suppliers on p.SupplierID equals s.SupplierID
                        where s.CompanyName == "Tokyo Traders"
                        select new
                        {
                            TenSP = p.ProductName
                        }
                    ).ToList();

                Console.WriteLine("Các Product (ProductName) do CompanyName “Tokyo Traders” cung cấp: ");

                Console.WriteLine("\t| STT |        ProductName           |");

                foreach (var product in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {product.TenSP,-28} |");
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
            try{
                variables = 0;

                Console.WriteLine("5. Liệt kê các Customer (ContactName) ở City là “Berlin”.");

                var query = (
                        from cs in db.Customers
                        where cs.City == "Berlin"
                        select new
                        {
                            TenKH = cs.ContactName
                        }
                    ).ToList();

                Console.WriteLine("Các Customer (ContactName) ở City là “Berlin”: ");

                Console.WriteLine("\t| STT |        ContactName           |");

                foreach (var cs in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {cs.TenKH,-28} |");
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
            try{
                variables = 0;

                Console.WriteLine("===================================================");
                Console.WriteLine("6. Liệt kê tất cả các Products (ProductID, ProductName) của CategoryName = “Meat/Poultry”.");

                var query = from pro in db.Products
                            join cat in db.Categories on pro.CategoryID equals cat.CategoryID
                            where cat.CategoryName == "Meat/Poultry"
                            select new
                            {
                                proID = pro.ProductID,
                                proName = pro.ProductName
                            };

                Console.WriteLine("Các sản phẩm có Category Name = 'Meat/Poultry' là: ");

                Console.WriteLine("\t| STT | ProductID |        ProductName       |");

                foreach (var customer in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {customer.proID,-9} | {customer.proName,-24} |");
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
            try{
                variables = 0;

                Console.WriteLine("===================================================");
                Console.WriteLine("7. Liệt kê tất cả các Order (OrderDate, ShipName) được ship đến ShipCountry là “Germany”.");

                var query = from ord in db.Orders
                            where ord.ShipCountry == "Germany"
                            select new
                            {
                                orderDate = string.Format("{0:dd/MM/yyyy}", ord.OrderDate),
                                shipName = ord.ShipName
                            };
                Console.WriteLine("Các đơn hàng được ship đến ShipCountry là Germany là: ");

                Console.WriteLine("\t| STT |     OrderDate       |           ShipName           |");

                foreach (var order in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {order.orderDate,-19} | {order.shipName,-28} |");
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
            try{
                variables = 0;

                Console.WriteLine("===================================================");
                Console.WriteLine("8. Liệt kê các Product (ProductID, ProductName) chưa được đặt hàng (UnitsOnOrder=0).");

                var query = from pro in db.Products
                            where pro.UnitsOnOrder == 0
                            select new
                            {
                                proID = pro.ProductID,
                                proName = pro.ProductName
                            };

                Console.WriteLine("Các sản phẩm chưa được đặt hàng là: ");

                Console.WriteLine("\t| STT | ProductID |             ProductName            |");

                foreach (var customer in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {customer.proID,-9} | {customer.proName,-34} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("9. Liệt kê các Supplier (CompanyName, ContactName) cung cấp 10 Product trở lên\r\n(ProductName, UnitPrice, UnitsInStock).");

            try
            {
                var query = from p in db.Products
                            join s in db.Suppliers on p.SupplierID equals s.SupplierID
                            group new {s, p} by new { s.CompanyName, s.ContactName, p.ProductName, p.UnitPrice, p.UnitsInStock } into g
                            where g.Count() >= 10
                            select g.Key;

                Console.WriteLine("\ncác Supplier cung cấp 10 Product trở lên: ");
                foreach (var result in query)
                {
                    Console.WriteLine($"{result.CompanyName}\t{result.ContactName}\t{result.ProductName}\t{result.UnitPrice}\t{result.UnitsInStock}");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("10. Liệt kê các Products chưa được bán (ProductName, UnitPrice, UnitsInStock).");

            try
            {
                var query = from p in db.Products
                            where p.UnitsInStock > 0
                            && !db.Order_Details.Any(od => od.ProductID == p.ProductID)
                            select new
                            {
                                TenSP = p.ProductName,
                                gia = p.UnitPrice,
                                sl = p.UnitsInStock,
                            };

                Console.WriteLine("\nCác Products chưa được bán (ProductName, UnitPrice, UnitsInStock): ");
                Console.WriteLine("\t| STT |        ProductName           |        UnitPrice           |        UnitsInStock           |");

                foreach (var p in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {p.TenSP,-28} | {p.gia, -28} | {p.sl, -28}");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("11. Liệt kê các Supplier (CompanyName) chưa cung cấp Product nào.");

            try
            {
                var query = from sup in db.Suppliers
                            join product in db.Products on sup.SupplierID equals product.SupplierID into g
                            from product in g.DefaultIfEmpty()
                            where product == null
                            select new
                            {
                                TenCT = sup.CompanyName
                            };

                Console.WriteLine("\nCác Supplier (CompanyName) chưa cung cấp Product nào: ");
                Console.WriteLine("\t| STT |        CompanyName           |");

                foreach (var p in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {p.TenCT,-28} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("12. Tính doanh thu năm 1996.");
            try
            {
                var revenue = (
                    from od in db.Order_Details
                    join ors in db.Orders on od.OrderID equals ors.OrderID 
                    where ors.OrderDate.HasValue && ors.OrderDate.Value.Year == 1996
                    select (decimal)od.UnitPrice * od.Quantity * (decimal)(1 - od.Discount)
                ).Sum();

                Console.WriteLine($"Doanh thu năm 1996: {revenue}");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to open the connection");
                Console.WriteLine(ex.Message);
            }
        }

        public static void TruyVan13()
        {
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("13. Đếm số Product của từng Category (CatagoryName, QuantityPro).");
            try
            {
                var categoryCounts = (
                    from c in db.Categories
                    join p in db.Products on c.CategoryID equals p.CategoryID
                    group new { c, p } by c.CategoryName into g
                    select new
                    {
                        CategoryName = g.Key,
                        QuantityPro = g.Count()
                    }
                ).OrderByDescending(x => x.QuantityPro).ToList();
                Console.WriteLine("\nSố Product của từng Category: ");
                Console.WriteLine("\t| STT |        CategoryName          |        QuantityPro           ");

                foreach (var ct in categoryCounts)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {ct.CategoryName,-28} |  {ct.QuantityPro,-28} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("14. Đếm số Product của từng Supplier (CompanyName, QuantityPro).");
            try
            {
                var SupplierCounts = (
                    from sup in db.Suppliers
                    join prod in db.Products on sup.SupplierID equals prod.SupplierID
                    group new { sup, prod } by sup.CompanyName into g
                    select new
                    {
                        CompanyName = g.Key,
                        QuantityPro = g.Count()
                    }
                ).OrderByDescending(x => x.QuantityPro).ToList();
                Console.WriteLine("\nSố Product của từng Category: ");
                Console.WriteLine("\t| STT |        CompanyName               \t |        QuantityPro           ");

                foreach (var sup in SupplierCounts)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {sup.CompanyName,-40} |  {sup.QuantityPro,-28} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("15. Cho biết Order (CustomerID, OrderDate) có trị giá (UnitPrice * Quantity và Discount) lớn nhất.");
            try
            {
                var maxTotalOrder = (
                    from od in db.Order_Details
                    join ors in db.Orders on od.OrderID equals ors.OrderID
                    group new { od, ors, Total = ((decimal)od.UnitPrice * od.Quantity * (decimal)(1 - od.Discount)) } by new { ors.CustomerID, ors.OrderDate } into g
                    orderby g.Max(x => x.Total) descending
                    select new
                    {
                        CustomerID = g.Key.CustomerID,
                        OrderDate = g.Key.OrderDate,
                        MaxTotal = g.Max(x => x.Total)
                    }
                ).ToList().Take(1);
                Console.WriteLine("\nCho biết Order (CustomerID, OrderDate) có trị giá (UnitPrice * Quantity và Discount) lớn nhất: ");
                Console.WriteLine("\t| STT |        CustomerID           |        OrderDate           |        Total           |");

                foreach (var item in maxTotalOrder)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {item.CustomerID,-27} | {item.OrderDate,-26} | {item.MaxTotal,-22} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("16. Cho biết Customer (ContactName) có Order có trị giá cao nhất.");
            try
            {
                var maxCustomerOrder = (
                    from cs in db.Customers 
                    join ors in db.Orders on cs.CustomerID equals ors.CustomerID
                    join od in db.Order_Details on ors.OrderID equals od.OrderID
                    group new { od, ors, cs, Total = ((decimal)od.UnitPrice * od.Quantity * (decimal)(1 - od.Discount)) } by new { cs.ContactName } into g
                    orderby g.Max(x => x.Total) descending
                    select new
                    {
                        ContactName = g.Key.ContactName,
                        MaxTotal = g.Max(x => x.Total)
                    }
                ).ToList().Take(1);

                Console.WriteLine("\nCho biết Customer (ContactName) có Order có trị giá cao nhất: ");
                Console.WriteLine("\t| STT |        ContactName           |        Total           |");

                foreach (var item in maxCustomerOrder)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {item.ContactName, -28} | {item.MaxTotal, -22} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("17. Đếm số lần mua hàng của Customer (ContactName, Quantity).");
            try
            {
                var CustomerOrder = (
                    from ors in db.Orders
                    join cs in db.Customers on ors.CustomerID equals cs.CustomerID 
                    group new { ors, cs} by new { cs.ContactName } into g
                    select new {
                            ContactName = g.Key.ContactName,
                            Quantity = g.Count()
                        }
                    )
                    .OrderByDescending(c => c.Quantity).ToList();

                Console.WriteLine("\nSố lần mua hàng của Customer (ContactName, Quantity): ");
                Console.WriteLine("\t| STT |        ContactName           |        Quantity           |");

                foreach (var item in CustomerOrder)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {item.ContactName,-28} | {item.Quantity,-25} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("18. Tìm Customer (ContactName) có số lần mua hàng nhiều nhất..");
            try
            {
                var CustomerOrder = (
                    from ors in db.Orders
                    join cs in db.Customers on ors.CustomerID equals cs.CustomerID
                    group new { ors, cs } by new { cs.ContactName } into g
                    select new
                    {
                        ContactName = g.Key.ContactName,
                        Quantity = g.Count()
                    }
                    )
                    .OrderByDescending(c => c.Quantity).Take(1);

                Console.WriteLine("\nSố lần mua hàng của Customer (ContactName, Quantity): ");
                Console.WriteLine("\t| STT |        ContactName           |        Quantity           |");

                foreach (var item in CustomerOrder)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {item.ContactName,-28} | {item.Quantity,-25} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("19. Tìm Employee chưa lập Order nào.");
            try
            {
                var employeesWithoutOrders = (
                    from emp in db.Employees
                    join ord in db.Orders on emp.EmployeeID equals ord.EmployeeID into employeeOrders
                    from em_or in employeeOrders.DefaultIfEmpty()
                    where em_or.EmployeeID == null
                    select new
                    {
                        LastName = emp.LastName,
                        FirstName = emp.FirstName
                    }
                ).ToList();

                Console.WriteLine("\nSố lần mua hàng của Customer (ContactName, Quantity): ");
                Console.WriteLine("\t| STT |        LastName           |        FirstName           |");

                foreach (var item in employeesWithoutOrders)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {item.LastName,-28} | {item.FirstName,-25} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("20. Tính tổng số lượng bán ra của mỗi Product (ProductName, Quantity) trong năm 1996.");
            try
            {
                var productQuantities = (
                    from p in db.Products
                    join od in db.Order_Details on p.ProductID equals od.ProductID
                    join ors in db.Orders on od.OrderID equals ors.OrderID
                    where ors.OrderDate.HasValue && ors.OrderDate.Value.Year == 1996
                    group new { p, od.Quantity } by p.ProductName into g
                    select new
                    {
                        ProductName = g.Key,
                        Quantity = g.Sum(item => item.Quantity)
                    }
                ).OrderByDescending(x => x.Quantity).ToList();

                Console.WriteLine("\n tổng số lượng bán ra của mỗi Product (ProductName, Quantity) trong năm 1996.");
                Console.WriteLine("\t| STT |        ProductName           \t\t |        Quantity           |");

                foreach (var item in productQuantities)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {item.ProductName,-40} | {item.Quantity,-25} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("21. Liệt kê Supplier theo từng City (CompanyName).");
            try
            {
                var query = (
                        from sup in db.Suppliers
                        group sup by new { sup.CompanyName, sup.City } into g
                        select new
                        {
                            City = g.Key.City,
                            Company = g.Key.CompanyName
                        }
                    ).ToList();

                Console.WriteLine("\n Liệt kê Supplier theo từng City (CompanyName)");
                Console.WriteLine("\t| STT |        City       \t|        CompanyName          \t\t|");

                foreach (var item in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {item.City,-23} | {item.Company,-40} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("22. Cho biết 3 Customer có doanh số cao nhất (ContactName, Sales).");
            try
            {
                var query = (
                    from cs in db.Customers
                    join ors in db.Orders on cs.CustomerID equals ors.CustomerID
                    join od in db.Order_Details on ors.OrderID equals od.OrderID
                    group new { od, ors, cs, Total = ((decimal)od.UnitPrice * od.Quantity * (decimal)(1 - od.Discount)) } by new { cs.ContactName } into g
                    select new
                    {
                        ContactName = g.Key.ContactName,
                        Sales = g.Sum(sum => sum.Total)
                    }
                ).OrderByDescending(ele => ele.Sales).ToList().Take(3);

                Console.WriteLine("\n 22. Cho biết 3 Customer có doanh số cao nhất (ContactName, Sales)");
                Console.WriteLine("\t| STT |        ContactName       \t\t|        Sales          \t\t|");

                foreach (var item in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {item.ContactName,-39} | {item.Sales,-37} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("23. Tính doanh số bán hàng của từng tháng trong năm 1996.");
            try
            {
                var query = (
                    from order in db.Orders
                    join orderDetail in db.Order_Details on order.OrderID equals orderDetail.OrderID
                    where order.OrderDate.HasValue && order.OrderDate.Value.Year == 1996
                    group orderDetail by new
                    {
                        SalesMonth = order.OrderDate.Value.Month
                    } into g
                    orderby g.Key.SalesMonth
                    select new
                    {
                        SalesMonth = g.Key.SalesMonth,
                        TotalSales = g.Sum(od => (decimal)od.UnitPrice * od.Quantity * (decimal)(1 - od.Discount))
                    }
                ).ToList();

                Console.WriteLine("\n Tính doanh số bán hàng của từng tháng trong năm 1996: ");
                Console.WriteLine("\t| STT |        Month       |        TotalSales       |");

                foreach (var item in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {item.SalesMonth,-18} | {item.TotalSales,-23} |");
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
            variables = 0;

            Console.WriteLine("===================================================");
            Console.WriteLine("24. Tính doanh thu của từng Product trong năm 1996.");
            try
            {
                var query = (
                     from pr in db.Products
                     join od in db.Order_Details on pr.ProductID equals od.ProductID
                     join ors in db.Orders on od.OrderID equals ors.OrderID
                     where ors.OrderDate.HasValue && ors.OrderDate.Value.Year == 1996
                     group new { od, ors, pr, Total = ((decimal)od.UnitPrice * od.Quantity * (decimal)(1 - od.Discount)) } by new { pr.ProductName } into g
                     select new
                     {
                         ProductName = g.Key.ProductName,
                         TotalRevenue = g.Sum(sum => sum.Total)
                     }
                 ).OrderByDescending(ele => ele.TotalRevenue).ToList();

                Console.WriteLine("\n Doanh thu của từng Product trong năm 1996.");
                Console.WriteLine("\t| STT |        ProductName       \t\t|        TotalRevenue         \t\t|");

                foreach (var item in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {item.ProductName,-39} | {item.TotalRevenue,-37} |");
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
            try{
                variables = 0;

                Console.WriteLine("25. Tính tổng số tiền vận chuyển hàng (Freight - Order) đến từng nước.");

                var query = from o in db.Orders
                            group o by new { o.ShipCountry } into g
                            select new
                            {
                                country = g.Key.ShipCountry,
                                sales = g.Sum(x => x.Freight)
                            };

                Console.WriteLine("Tổng số tiền vận chuyển hàng (Freight - Order) đến từng nước:");
                Console.WriteLine("\t| STT |       Country       | Tổng tiền vận chuyển |");

                foreach (var order in query)
                {
                    variables++;
                    Console.WriteLine($"\t| {variables,-3} | {order.country,-19} | {order.sales,-20} |");
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