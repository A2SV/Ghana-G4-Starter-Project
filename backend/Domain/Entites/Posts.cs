using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Domain.Common;

namespace Domain.Entities
{
    public class Posts : BaseEntity
    {
        public string Content { get; set; }
        public string Tag {get; set;}
    }
}