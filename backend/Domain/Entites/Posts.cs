using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Domain.Common;

namespace backend.Domain.Entities
{
    public class Posts : BaseEntity
    {
        public string Content { get; set; }
        public string Tag {get; set;}
        public Users User { get; set; }
        
        public int UserId { get; set; }  

    }
}