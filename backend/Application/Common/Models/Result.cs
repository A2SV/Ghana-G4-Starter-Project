namespace Application.Common.Models
{
    public class Result
    {
        public bool IsSuccess { get; private set; }
        public string ErrorMessage { get; private set; }
        public object Data { get; private set; }

        public static Result Success(object data = null)
        {
            return new Result { IsSuccess = true, Data = data };
        }

        public static Result Failure(string message)
        {
            return new Result { IsSuccess = false, ErrorMessage = message };
        }
    }
}
