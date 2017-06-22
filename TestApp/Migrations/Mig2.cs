using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentMigrator;

namespace TestApp.Migrations
{
    [Migration(2)]
    public class Mig2 : Migration
    {
        public override void Up()
        {
            Create.Table("person2")
                .WithColumn("Id").AsGuid().PrimaryKey()
                .WithColumn("Name").AsString();
            Execute.Script(@"MigrationFiles\ord_tables.sql");
        }

        public override void Down()
        {
            
        }
    }
}
