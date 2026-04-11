#' D&D Dice Roller
#'
#' Simulates rolling standard polyhedral dice (d4, d6, d8, d10, d20).
#' Users can specify the quantity and whether to receive the individual
#' set or the total sum.
#'
#' @param die_type Numeric. The number of sides (e.g., 4, 6, 8, 10, 20).
#' @param dice_count Numeric. How many dice of this type to roll.
#' @param output_mode Character. Either "set" (individual rolls) or "sum" (total).
#'
#' @return A numeric vector of rolls or a single summed value.
#' @export

dice_roller <- function(die_type, dice_count, output_mode = "sum") {

  # 1. Input Validation
  if (!is.numeric(die_type) || die_type < 1) {
    stop("Error: 'die_type' must be a positive number")
  }
  if (!is.numeric(dice_count) || dice_count < 1) {
    stop("Error: 'dice_count' must be a positive number.")
  }
  if (!(output_mode %in% c("sum", "set"))) {
    stop("Error: Invalid output_mode.")
  }

  # Verify inputs are whole numbers
  die_type <- as.integer(die_type)
  dice_count <- as.integer(dice_count)

  # 2. Roll the dice: sample with replacement
  roll_results <- sample(1:die_type, size = dice_count, replace = TRUE)

  # 3. Evaluate output mode and return results
  if (output_mode == "sum") {
    return(sum(roll_results))
  } else {
    return(roll_results)
  }
}
