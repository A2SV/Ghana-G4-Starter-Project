namespace Application.Response
{
    public class Result
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; } = string.Empty;
        public string Token { get; set; } = string.Empty;

        public static Result Success()
        {
            return new Result { IsSuccess = true };
        }

        public static Result Success(string message, string token)
        {
            return new Result { IsSuccess = true, Message = message, Token = token };
        }

        public static Result Failure(string message)
        {
            return new Result { IsSuccess = false, Message = message };
        }
    }
}
