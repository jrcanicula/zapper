using System;
using System.IO;
using System.Linq;

namespace UserSettingStorageZapper
{
    public class UserSettingStorageZapper
    {
        // Reads the settings from a file
        public static string ReadSettings(string filePath)
        {
            if (!File.Exists(filePath))
            {
                throw new FileNotFoundException("Settings file not found.");
            }

            byte[] data = File.ReadAllBytes(filePath);
            return Convert.ToString(data[0], 2).PadLeft(8, '0');
        }

        // Writes the settings to a file
        public static void WriteSettings(string filePath, string settings)
        {
            if (settings.Length != 8 || !settings.All(c => c == '0' || c == '1'))
            {
                throw new ArgumentException("Settings must be a string of 8 characters consisting of '0' or '1'.");
            }

            byte data = Convert.ToByte(settings, 2);
            File.WriteAllBytes(filePath, new byte[] { data });
        }

        public static void Main(string[] args)
        {
            string filePath = "settings.dat";

            // Example settings string
            string settings = "10101010";

            // Write the settings to a file
            WriteSettings(filePath, settings);

            // Read the settings from the file
            string readSettings = ReadSettings(filePath);
            Console.WriteLine(readSettings); // Output: 10101010
        }
    }
}
