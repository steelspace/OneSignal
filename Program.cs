class Program
{
    static void Main(string[] args)
    {
        var oneSignalService = new OneSignalService();

        var externalUserId = "petr.valach@hotmail.com";

        try
        {
            // oneSignalService.CreatePlayer(externalUserId);
            // oneSignalService.Subscribe(externalUserId, "sub-news");
            oneSignalService.SendEmailToTaggedUsers("sub-news");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
}
