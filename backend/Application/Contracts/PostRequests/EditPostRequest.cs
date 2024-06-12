using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Contracts.PostRequests
{
    public class EditPostRequest
    {
        
        public string Content {get; set;} = string.Empty;
        public string Tag {get; set;} = string.Empty;
    }
}

