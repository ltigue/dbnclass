using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace nclassthurs.Models
{
    public class Part
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public string PartID { get; set; }
        public string Type { get; set; }
        public decimal Price { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}