
select *
from NewPortfolioProject..CovidDeaths
Where continent is not null
order by 3,4


--select *
--from NewPortfolioProject..CovidVaccinations
--order by 3,4

--Select Data that we are going to be using

Select location, date, total_cases, new_cases, total_deaths, population
from NewPortfolioProject..CovidDeaths
Where continent is not null
order by 1,2


-- Looking at Total Cases Vs Total Deaths
-- Shows the liklihood of dying if you contract Covid in your country
Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from NewPortfolioProject..CovidDeaths
Where location like '%states%'
and continent is not null
order by 1,2


--Looking at the Total Cases Vs Population
--Shows what percentage of population got Covid

Select location, date, population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
from NewPortfolioProject..CovidDeaths
--Where location like '%states%'
Where continent is not null
order by 1,2

--Looking at countries with Highest Infection Rate compared to population

Select location, population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
from NewPortfolioProject..CovidDeaths
--Where location like '%states%'
Where continent is not null
Group by location, population
order by PercentPopulationInfected desc

--Showing the countries with the highest Death count per population

Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from NewPortfolioProject..CovidDeaths
--Where location like '%states%'
Where continent is not null
Group by location
order by TotalDeathCount desc

--Showing the continents with the highest death count

Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from NewPortfolioProject..CovidDeaths
--Where location like '%states%'
Where continent is not null
Group by location
order by TotalDeathCount desc

--GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM
 (New_cases)*100 as DeathPercentage
from NewPortfolioProject..CovidDeaths
Where continent is not null
--Group by date
order by 1,2




--Looking at Total population vs Vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From NewPortfolioProject..CovidDeaths dea
Join NewPortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3



--Looking at Total population vs New Vaccinations (Showing Accumilated new vaccinations for each location on each day)

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) over (partition by dea.Location order by dea.location, dea.Date)
as RollingPeopleVaccinated
From NewPortfolioProject..CovidDeaths dea
Join NewPortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3



-- Percentage vaccinated against location's population using CTE
With PopvsVac (Continent, Location, Date, Population, New_Vaccinaitons, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) over (partition by dea.Location order by dea.location, dea.Date)
as RollingPeopleVaccinated
From NewPortfolioProject..CovidDeaths dea
Join NewPortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac
--##If looking for specific Country
--where Location = 'Albania' 


--TEMP TABLE
Drop Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)
Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) over (partition by dea.Location order by dea.location, dea.Date)
as RollingPeopleVaccinated
From NewPortfolioProject..CovidDeaths dea
Join NewPortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null
--order by 2,3
Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated


--Creating view to store data for later visualisations

--Create view PercentPopulationVaccinated as
--Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
--SUM(cast(vac.new_vaccinations as int)) over (partition by dea.Location order by dea.location, dea.Date)
--as RollingPeopleVaccinated
--From NewPortfolioProject..CovidDeaths dea
--Join NewPortfolioProject..CovidVaccinations vac
--	on dea.location = vac.location
--	and dea.date = vac.date
--where dea.continent is not null
----order by 2,3


--Select*
--From PercentPopulationVaccinated


Go
Alter view PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) over (partition by dea.Location order by dea.location, dea.Date)
as RollingPeopleVaccinated
From NewPortfolioProject..CovidDeaths dea
Join NewPortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
Go

Select*
From PercentPopulationVaccinated