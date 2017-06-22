using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentMigrator;

namespace TestApp.Migrations
{
    [Migration(1)]
    public class Mig1 : Migration
    {
        public override void Up()
        {
            Create.Table("person")
                .WithColumn("Id").AsGuid().PrimaryKey()
                .WithColumn("Name").AsString();
        }

        public override void Down()
        {
            Delete.Table("person");
        }
    }
}
