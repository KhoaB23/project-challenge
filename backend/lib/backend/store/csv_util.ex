defmodule Backend.Store.CSVUtil do
  @moduledoc """
    Utility module to ingest `campaigns.csv`
  """

  alias NimbleCSV.RFC4180, as: CSV

  def csv_row_to_table_record(file) do
    column_names = get_column_names(file)

    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: true)
    |> Enum.map(fn row ->
      row
      |> Enum.with_index()
      |> Map.new(fn {val, num} -> {column_names[num], val} end)
      |> create_or_skip()
    end)
  end

  defp get_column_names(file) do
    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: false)
    |> Enum.fetch!(0)
    |> Enum.with_index()
    |> Map.new(fn {val, num} -> {num, val} end)
  end

  defp create_or_skip(row) do
    case Backend.Repo.get_by(Backend.Store.Campaign,
        name: row["name"],
        description: row["description"]
    ) do
      nil ->
        Backend.Repo.insert!(%Backend.Store.Campaign{
          budget: String.to_float(row["budget"]),
          description: row["description"],
          end_date: row["end_date"],
          hashtags: row["hashtags"],
          name: row["name"],
          start_date: row["start_date"],
          team_id: String.to_integer(row["team_id"])})

      campaign ->
        {:ok, campaign}
    end
  end
end
