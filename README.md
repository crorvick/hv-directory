# Overview

Generate a directory for Hobson Village (Naperville, IL) residents from
a CSV data file.  Two files are generated:

 * `directory.pdf` - Pages are formatted indivually and ordered by page.
   This is file is for review only.

 * `directory_for_printer.pdf` - Output formatted for the printer.
   Pages are paired up by how they should be printed and inside margins
   are adjusted to account for the fold.

# Format

The input CSV data file should have the following format:

    House,Street,Last1,First1,Last2,First2,Phone,Children

 * House - The house number from the street address.
 * Street - The full name of the street.  Should be one of:
   * Blue Larkspur Lane
   * Canonero Drive
   * Celtic Ash Court
   * Challdon Court
   * South Charles Avenue
   * Chateaugay Avenue
   * Citation Avenue
   * Count Fleet Court
   * Dark Star Road
   * Faireno Court
   * East Gartner Road
   * Iron Liege Court
   * Jaipur Avenue
   * Kaui King Court
   * Needles Court
   * Omaha Court
   * Riva Ridge Court
   * Secretariat Drive
   * Sir Barton Court
   * Tim Tam Circle
   * Venetian Court
   * Whirlaway Avenue
 * Last1 - Last name of resident.  Leave blank if unlisted or
   uninhabited.
 * First1 - First name of resident.  Leave blank if unlisted or
   uninhabited.
 * Last2 - Last name of second resident.  Leave blank if same as Last1.
 * First2 - First name of second resident.  Leave blank if none.
 * Phone - Phone number in "(XXX) XXX-XXXX" format.  Leave blank if
   unlisted.
 * Children - Comma-separated list of children and years born formatted
   as "Name 'XX".  Only include first name if last is same.
