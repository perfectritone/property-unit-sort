#!/usr/bin/env elixir

#filename = "units.txt"
filename = List.first(System.argv) || raise "Enter a filename"
{:ok, units_bitstring} = File.read filename
units = String.split(units_bitstring, "\n", trim: true)

apartment_regex = ~r/^#?(?<num>\d+)(?<sub_id>\w*).*/

apartment_unit_sorter = fn unit_string ->
  match = Regex.named_captures(apartment_regex, unit_string)
  num = elem(Integer.parse(Map.get(match, "num")), 0)
  sub_id = Map.get(match, "sub_id")

  [num, sub_id]
end

sorted_apartments = Enum.sort_by(units, apartment_unit_sorter)
Enum.each sorted_apartments, &IO.puts/1
