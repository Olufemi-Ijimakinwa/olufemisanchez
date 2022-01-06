
-- Covid Cases in Nigeria
select continent, location, date, total_cases, new_cases, total_deaths, population
from CovidDeaths
where continent is not null
and location = 'Nigeria'

select location, max(total_cases) as TotalCases, max(convert(int, total_deaths)) as TotalDeaths
from CovidDeaths
where location = 'Nigeria'
group by location

-- Africa Stats
select continent, max(total_cases) as TotalCases, max(convert(int, total_deaths)) as TotalDeaths
from CovidDeaths
where continent = 'Africa'
group by continent

select continent,location, max(total_cases) as TotalCases, max(convert(int, total_deaths)) as TotalDeaths
from CovidDeaths
where continent = 'Africa'
group by continent, location
order by 3 desc


-- Global Numbers
select continent, max(total_cases) as TotalCases, max(convert(int, total_deaths)) as TotalDeaths
from CovidDeaths
where continent is not null
group by continent
order by 2 desc

with cte_continent as 
(select continent, max(total_cases) as TotalCases, max(convert(int, total_deaths)) as TotalDeaths
from CovidDeaths
where continent is not null
group by continent
)
select *, TotalDeaths/TotalCases *100 as DeathtoCaseRatio
from cte_continent
order by 4 desc

-- Covid Test and Vaccinated Numbers
select continent, max(convert(numeric, total_tests)) as TotalTests,
max(convert(numeric,total_vaccinations)) as TotalVac,
max(convert(numeric,people_vaccinated)) as PplVac, max(convert(numeric,people_fully_vaccinated)) as PplFullyVac
from CovidVaccinations
where continent is not null
group by continent
order by 2 desc

-- Create view to store for Visualizations

create view ContinentCases as
select continent, max(total_cases) as TotalCases, max(convert(int, total_deaths)) as TotalDeaths
from CovidDeaths
where continent is not null
group by continent
--order by 2 desc
