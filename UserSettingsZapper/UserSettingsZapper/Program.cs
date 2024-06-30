using System;

namespace UserSettingsZapper
{
    public class UserSettingsZapper
    {
        //check if feature is enabled given the input
        public static bool IsFeatureEnabled(string settings, int setting)
        {
            // Just to make sure we don't get an out-of-bounds error
            if (setting < 1 || setting > 8)
            {
                throw new ArgumentOutOfRangeException(nameof(setting), "Setting must be between 1 and 8.");
            }

            // Adjusting setting to zero-based index
            int index = setting - 1;
            return settings[index] == '1';
        }

        // for the test cases
        public static void Main(string[] args)
        {
            Console.WriteLine(IsFeatureEnabled("00000000", 7)); // Should print: false
            Console.WriteLine(IsFeatureEnabled("00000010", 7)); // Should print: true
            Console.WriteLine(IsFeatureEnabled("11111111", 4)); // Should print: true
        }
    }
}
