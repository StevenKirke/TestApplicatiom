# TestApplicatiom

## Description
#### Данное приложение является тестовым. 
#### Включает в себя сцены:
##### * "Авторизации",
##### * "Поиск",
##### * "Избранное".
##### * "Отклики", 
##### * "Сообщения",
##### * "Профиль"

## Getting started
#### Для дальнейшей работы, необходимо скачать архив или клонировать проект с ресурса GitHub.
#### Разархивировать.
#### Открыть папку с проектом и запустить файл Test application.xcodeproj

## Usage
####

## Architecture
#### В данном проекте используется архитектура MVVM + Коряво сделаный и полуработающий Coordinator.

## Structure
### Current structure 
### (Отображение структуры в GitHub не соответствует структуре в проекте, ниже приведена файловая структура проекта)

``` bash
└── Test application
     ├── README.md
     ├── swiftlint.yml
     └── Test application
        ├── GlobalModel
        │   └── GlobalFavoritesModel.swift
        ├── Coordinators
        │   ├── AppCoordinator
        │   │   ├── TabBarCoordinator.swift
        │   │   └── TabBarCoordinatorView.swift
        │   └── SearchCoordinator
        │       ├── SearchCoordinator.swift
        │       └── SearchCoordinatorView.swift
        ├── ConertorsDTO
        │   ├── IConvertorVacanciesDTO.swift
        │   ├── IConvertorOffersDTO.swift
        │   └── ConvertVacancyDTO.swift
        ├── Services
        │   ├── CounterVacanciesService.swift
        │   ├── EMailValidationService.swift
        │   ├── AssemblerURLService.swift
        │   ├── DateConvertService.swift
        │   ├── DeclinationNumberService.swift
        │   └── CropElementInTextService.swift
        ├── Managers
        │   ├── NetworkManager.swift
        │   └── DecodeJSONManager.swift
        ├── Extensions
        │   ├── Extension+View.swift
        │   └── Extension+Color.swift
        ├── Flows
       	│   ├── TabBarFLow
        │   │   └── TabBarScene
        │   ├── LoginFlow
        │   │   ├── LoginScene
        │   │   │	├── AssemblerLoginView.swift
        │   │   │	├── LoginView.swift
        │   │   │	├── LoginIterator.swift
        │   │   │	└── LoginViewModel.swift
        │   │   └── PasswordScene
        │   │    	├── AssemblerPasswordView.swift
        │   │    	├── PasswordView.swift
        │   │    	├── PasswordIterator.swift
        │   │    	└── PasswordViewModel.swift
        │   ├── SearchFlow
        │   │   ├── MainSearchScene
        │   │   │	├── AssemblerMainSearch.swift
        │   │   │ 	├── MainSearchView.swift
        │   │   │	├── MainSearchIterator.swift
        │   │   │	├── MainSearchViewModel.swift
        │   │   │	├── MainSearchModel.swift
        │   │   │	├── Worker
        │   │   │	│	├── MainSearchWorker.swift
        │   │   │	│	└── VacancyListDTO.swift
        │   │   │	└── AdditionalView
        │   │   │	 	├── VacanciesCollection.swift
        │   │   │	 	├── OffersCollection.swift
        │   │   │	 	└── SearchFilterView.swift
        │   │   └── JobPageScene
        │   │    	├── AssemblerPageScene.swift
        │   │    	├── JobPageView.swift
        │   │    	├── JobPageIterator.swift
        │   │    	├── JobPageViewModel.swift
        │   │    	├── JobPageWorker.swift
        │   │    	└── JobPageModel.swift
        │   ├── FavoritesFlow
        │   │   └── MainFavoritesScene
        │   │   	├── AssemblerMainFavorites.swift
        │   │   	└── MainFavoritesScene.swift
        │   ├── ResponseFlow
        │   │   └── MainResponseScene
        │   │   	├── AssemblerMainResponse.swift
        │   │   	└── MainResponseView.swift
        │   ├── MassagesFlow
        │   │   └── MainMassagesScene
        │   │   	├── AssemblerMainMassage.swift
        │   │   	└── MainMassagesView.swift
        │   └── ProfileFlow
        │       └── MainProfileScene
        │       	├── AssemblerMainProfile.swift
        │       	└── MainProfileView.swift
        ├── Resources
        │   ├── Info.plist
        │   ├── Assets.xcassets
        │   └── LaunchScreen.storyboard
        └── Application
            ├── AppDelegate.swift
            └── SceneDelegate.swift
```

## Running the tests

## Dependencies
#### Pod - Нет.

## Workflow
#### App version: 15.3 (15E5202a)
#### iOS version: 16.2

## Design
#### Дизайн для приложения выполнен в Figma.
#### [Figma](https://www.figma.com/file/5n1Y5yxk3AnAbQ7g0ZfROG/Effective-Mobile.-%D0%A2%D0%B5%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B5-%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5-%D0%B4%D0%BB%D1%8F-%D1%80%D0%B0%D0%B7%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%87%D0%B8%D0%BA%D0%BE%D0%B2.-%D0%9F%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B4%D0%BB%D1%8F-%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0-%D0%B2%D0%B0%D0%BA%D0%B0%D0%BD%D1%81%D0%B8%D0%B9?type=design&mode=design&t=oGr9aoEVcyeKdrnh-0)

## Task boards
#### 

## API
#### В приложении используются API, такте как:
##### * [Mock](https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14) 
