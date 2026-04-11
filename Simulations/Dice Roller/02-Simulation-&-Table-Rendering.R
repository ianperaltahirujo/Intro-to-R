# Set a seed for reproducibility
set.seed(123)

# 1. Run the Simulation
n_sims <- 10000
d8_simulations <- replicate(n_sims, dice_roller(die_type = 8, dice_count = 2, output_mode = "set"))

# Row 1 represents the first die, and Row 2 represents the second die.
die1_results <- d8_simulations[1, ]
die2_results <- d8_simulations[2, ]

# 2. Create the Raw Frequency Table
# table() counts the occurrences of every pairwise combination
raw_frequencies <- table(Die1 = die1_results, Die2 = die2_results)

# 3. Calculate the Relative Frequencies
# prop.table() divides each cell by the total sum of the table (10,000)
relative_frequencies <- prop.table(raw_frequencies)

# 4. Display the Final Table
View(round(relative_frequencies, 4))
