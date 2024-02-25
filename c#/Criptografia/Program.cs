using System.Security.Cryptography;
using System.Text;

namespace Criptografia
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("--------------------------------------------------------------------------------------------------");
            Console.Write("HMAC SHA1 Hex: ");
            Console.WriteLine(HMACSHA1HashValueHexStr("8dc115f4e2b640f6a2bc4046fdc5c635", "gleryston-matos"));
            Console.Write("HMAC SHA256 Hex: ");
            Console.WriteLine(HMACSHA256HashValueHexStr("8dc115f4e2b640f6a2bc4046fdc5c635", "gleryston-matos"));
            Console.WriteLine("--------------------------------------------------------------------------------------------------");
            Console.Write("HMAC SHA1 Base64: ");
            Console.WriteLine(HMACSHA1HashValueBase64("8dc115f4e2b640f6a2bc4046fdc5c635", "gleryston-matos"));
            Console.Write("HMAC SHA256 Base64: ");
            Console.WriteLine(HMACSHA256HashValueBase64("8dc115f4e2b640f6a2bc4046fdc5c635", "gleryston-matos"));
            Console.WriteLine("--------------------------------------------------------------------------------------------------");
            Console.Write("MD5 01: ");
            Console.WriteLine(MD5HashValue("gleryston-matos"));
            Console.Write("MD5 02: ");
            Console.WriteLine(MD5HashValue("gleryston-matos"));
            Console.WriteLine("--------------------------------------------------------------------------------------------------");
        }

        private static byte[] BytesOf(string value)
        {
            value = value.Replace("\n", "#$A");
            UTF8Encoding encoding = new UTF8Encoding();

            return encoding.GetBytes(value);
        }

        public static string BytesOf(byte[] values)
        {
            string result = "";
            foreach (byte value in values)
                result += value.ToString("X2");

            return result;
        }

        private static string HMACSHA1HashValueHexStr(string key, string value)
        {
            byte[] keyByte = BytesOf(key);
            byte[] valueBytes = BytesOf(value);

            using (HMACSHA1 hash = new HMACSHA1(keyByte))
            {
                byte[] hashValue = hash.ComputeHash(valueBytes);
                string result = "0x" + BytesOf(hashValue);

                return result;
            }
        }

        private static string HMACSHA1HashValueBase64(string key, string value)
        {
            byte[] keyByte = BytesOf(key);
            byte[] valueBytes = BytesOf(value);

            using (HMACSHA1 hash = new HMACSHA1(keyByte))
            {
                byte[] hashValue = hash.ComputeHash(valueBytes);
                return Convert.ToBase64String(hashValue);
            }
        }

        private static string HMACSHA256HashValueHexStr(string key, string value)
        {
            byte[] keyByte = BytesOf(key);
            byte[] valueBytes = BytesOf(value);

            using (HMACSHA256 hash = new HMACSHA256(keyByte))
            {
                byte[] hashValue = hash.ComputeHash(valueBytes);
                string result = "0x" + BytesOf(hashValue);

                return result;
            }
        }

        private static string HMACSHA256HashValueBase64(string key, string value)
        {
            byte[] keyByte = BytesOf(key);
            byte[] valueBytes = BytesOf(value);

            using (HMACSHA256 hash = new HMACSHA256(keyByte))
            {
                byte[] hashValue = hash.ComputeHash(valueBytes);
                return Convert.ToBase64String(hashValue);
            }
        }

        private static string MD5HashValue(string value)
        {
            MD5 md5 = MD5.Create();

            byte[] inputBytes = Encoding.UTF8.GetBytes(value);
            byte[] hashBytes = md5.ComputeHash(inputBytes);

            return Convert.ToHexString(hashBytes);
        }
    }
}