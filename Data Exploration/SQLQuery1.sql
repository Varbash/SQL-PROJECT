Select *
from PORTFOLIOPROJECT..CovidDeaths$
order by 3,4

Select *
from PORTFOLIOPROJECT..CovidVaccinations$
order by 3,4

--selecting data--
Select Location, date, total_cases, new_cases,total_deaths ,population
from PORTFOLIOPROJECT..CovidDeaths$
order by 1,2


--TOTAL CASES VS TOTAL DEATHS--
--Likelihood of dying if infected--
Select Location, date, total_cases,total_deaths,(total_deaths/total_cases)*100 as Death_Percentage
from PORTFOLIOPROJECT..CovidDeaths$
Where location like '%India%'
order by 1,2


--Total cases vs population--
Select Location, date, total_cases,population ,(total_cases/population)*100 as Infected_Percentage
from PORTFOLIOPROJECT..CovidDeaths$
--Where location like '%India%'
order by 1,2


--Looking at Countries with highest infection rate--
Select Location,population ,MAX(total_cases) as Highest_infection,MAX((total_cases/population))*100 as Highest_Infected_Percentage
from PORTFOLIOPROJECT..CovidDeaths$
--Where location like '%India%'
Group by Location,population
order by Highest_Infected_Percentage desc

--Country with high death count--
Select Location,MAX(cast(Total_deaths as int)) as TotalDeathCount
from PORTFOLIOPROJECT..CovidDeaths$
--Where location like '%India%'
Where continent is not null
Group by Location,population
order by TotalDeathCount desc

--CONTINENT WISE BREAKDOWN--


--Continents with highest death count
Select continent,MAX(cast(Total_deaths as int)) as TotalDeathCount
from PORTFOLIOPROJECT..CovidDeaths$
--Where location like '%India%'
Where continent is not null
Group by continent
order by TotalDeathCount desc

--global numbers--

Select  date, SUM(new_cases) as total_cases,SUM(cast(new_deaths as int)) as total_deaths,SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
from PORTFOLIOPROJECT..CovidDeaths$
--Where location like '%India%'
where continent is not null
Group By date
order by 1,2

--Joining the two datasets
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
From PORTFOLIOPROJECT..CovidVaccinations$ vac
Join PORTFOLIOPROJECT..CovidDeaths$ dea
     On vac.location=dea.location
	 and vac.date=dea.date
where dea.continent is not null
order by 1,2,3

--looking at total population vs Vaccinations
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
From PORTFOLIOPROJECT..CovidVaccinations$ vac
Join PORTFOLIOPROJECT..CovidDeaths$ dea
     On vac.location=dea.location
	 and vac.date=dea.date
where dea.continent is not null
order by 1,2,3







