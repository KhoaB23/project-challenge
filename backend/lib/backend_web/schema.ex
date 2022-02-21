defmodule BackendWeb.Schema do
  use Absinthe.Schema

  alias BackendWeb.Resolvers.CampaignResolver

  object :campaigns do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :start_date, non_null(:string)
    field :end_date, :string
    field :budget, non_null(:float)
    field :hashtags, :string
    field :description, :string
  end

  query do
    @desc "Get all campaigns"
    field :all_campaigns, list_of(:campaigns) do
      resolve &CampaignResolver.list_campaigns/3
    end
  end
end
