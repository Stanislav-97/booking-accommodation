class Realties::Filter
  attr_reader :realty_params

  # {
  #   area: { from: 30, to: 90 },
  #   building_year: { from: 2010, to: 2024 },
  #   rooms_count: 3,
  #   realty_type: ["dacha"],
  #   floor: { from: 3, to: 10 },
  #   facility_ids: [1, 3, 7]
  # }

  def initialize(realty_params)
    @realty_params = realty_params
  end

  def call
    scope = Realty.includes(:facilities)

    scope = filter_by_area(scope)
    scope = filter_by_floor(scope)
    scope = filter_by_building_year(scope)
    scope = filter_by_rooms_count(scope)
    scope = filter_by_realty_type(scope)
    filter_by_facility_ids(scope)
  end

  private

  def filter_by_area(scope)
    return scope if realty_params[:area].blank?

    scope.where(area: realty_params.dig(:area, :from)..realty_params.dig(:area, :to))
  end

  def filter_by_floor(scope)
    return scope if realty_params[:floor].blank?

    scope.where(floor: realty_params.dig(:floor, :from)..realty_params.dig(:floor, :to))
  end

  def filter_by_building_year(scope)
    return scope if realty_params[:building_year].blank?

    scope.where(building_year: realty_params.dig(:building_year, :from)..realty_params.dig(:building_year, :to))
  end

  def filter_by_rooms_count(scope)
    return scope if realty_params[:rooms_count].blank?

    scope.where(rooms_count: realty_params[:rooms_count])
  end

  def filter_by_realty_type(scope)
    return scope if realty_params[:realty_type].blank?

    scope.where(realty_type: realty_params[:realty_type])
  end

  def filter_by_facility_ids(scope)
    return scope if realty_params[:facility_ids].blank?

    scope.where(facilities: { id: realty_params[:facility_ids] })
  end
end
