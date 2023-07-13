using System;
using System.Collections.Generic;

namespace PollProg
{
    class Program
    {
        static void Main(string[] args)
        {
            // Create a dictionary to store poll options and their vote counts
            Dictionary<string, int> pollOptions = new Dictionary<string, int>();

            // Add poll options
            pollOptions.Add("Option 1", 0);
            pollOptions.Add("Option 2", 0);
            pollOptions.Add("Option 3", 0);

            // Run the poll
            bool pollActive = true;
            while (pollActive)
            {
                Console.WriteLine("Please select an option:");
                Console.WriteLine("1. Vote");
                Console.WriteLine("2. View Results");
                Console.WriteLine("3. End Poll");

                int choice = GetChoice();

                switch (choice)
                {
                    case 1:
                        Vote(pollOptions);
                        break;
                    case 2:
                        ViewResults(pollOptions);
                        break;
                    case 3:
                        pollActive = false;
                        break;
                    default:
                        Console.WriteLine("Invalid choice. Please try again.");
                        break;
                }

                Console.WriteLine();
            }
        }

        static int GetChoice()
        {
            Console.Write("Enter your choice: ");
            while (true)
            {
                if (int.TryParse(Console.ReadLine(), out int choice))
                {
                    return choice;
                }
                else
                {
                    Console.Write("Invalid choice. Enter a valid choice: ");
                }
            }
        }

        static void Vote(Dictionary<string, int> pollOptions)
        {
            Console.WriteLine("Poll Options:");
            foreach (var option in pollOptions)
            {
                Console.WriteLine($"{option.Key}");
            }

            Console.Write("Enter your vote: ");
            string vote = Console.ReadLine();

            if (pollOptions.ContainsKey(vote))
            {
                pollOptions[vote]++;
                Console.WriteLine("Vote recorded successfully!");
            }
            else
            {
                Console.WriteLine("Invalid option. Vote not recorded.");
            }
        }

        static void ViewResults(Dictionary<string, int> pollOptions)
        {
            Console.WriteLine("Poll Results:");
            foreach (var option in pollOptions)
            {
                Console.WriteLine($"{option.Key}: {option.Value} votes");
            }
        }
    }
}
