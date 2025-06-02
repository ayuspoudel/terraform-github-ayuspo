locals {
  web_dev_repositories = {
    webdev_clone_amazon = {
      name            = "webdev-clone-amazon"
      description     = "A clone of Amazon's e-commerce platform built using HTML, CSS, and vanilla JavaScript. Implements product browsing, search, cart, and checkout functionality."
      visibility      = "public"
      auto_init       = true
      archived        = false
      has_downloads   = true
      topics          = ["webdev", "ecommerce", "clone", "html", "css", "javascript"]
    }

    webdev_tool_microservices_blog = {
      name            = "webdev-tool-microservices-blog"
      description     = "A microservices-based application built with React (frontend) and Express (backend), using an internal event bus for inter-service communication."
      visibility      = "public"
      auto_init       = true
      archived        = false
      has_downloads   = true
      topics          = ["webdev", "microservices", "react", "express"]
    }

    webdev_ui_dropdown_menu = {
      name            = "webdev-ui-dropdown-menu"
      description     = "Interactive dropdown menu built using JavaScript and CSS. Enhances navigation experience with clean styling and accessibility support."
      visibility      = "public"
      auto_init       = true
      archived        = false
      has_downloads   = true
      topics          = ["webdev", "javascript", "ui", "frontend"]
    }

    webdev_app_flat_guru_usf = {
      name            = "webdev-app-flat-guru-usf"
      description     = "MERN stack platform for off-campus housing and roommate search for USF international students. Provides search filters, listing management, and user profiles."
      visibility      = "public"
      auto_init       = true
      archived        = false
      has_downloads   = true
      topics          = ["webdev", "mern", "housing", "usf"]
    }

    webdev_app_green_rise_nepal = {
      name            = "webdev-app-green-rise-nepal"
      description     = "Full-stack MERN (MongoDB, Express, React, Node.js) application with job listings, interactive charts, and user authentication. Dockerized and deployed on cloud infrastructure."
      visibility      = "public"
      auto_init       = true
      archived        = false
      has_downloads   = true
      topics          = ["webdev", "mern", "fullstack", "docker"]
    }

    webdev_learn_js_journey = {
      name            = "webdev-learn-js-journey"
      description     = "Personal journey from C++ to JavaScript, covering foundational concepts like data structures, DOM, ES6 syntax, and backend development with Node.js."
      visibility      = "public"
      auto_init       = true
      archived        = false
      has_downloads   = true
      topics          = ["webdev", "javascript", "learning", "node"]
    }

    webdev_portfolio_main = {
      name            = "webdev-portfolio-main"
      description     = "Responsive developer portfolio website built using React, HTML, CSS, and JavaScript. Highlights projects, skills, and achievements with plans for future AWS integration."
      visibility      = "public"
      auto_init       = true
      archived        = false
      has_downloads   = true
      pages = {
        build_type = "legacy"
        custom_404 = false
        source = {
          branch = "main"
          path   = "/"
        }
      }
      topics          = ["webdev", "portfolio", "react", "frontend"]
    }

    webdev_learn_js_projects = {
      name            = "webdev-learn-js-projects"
      description     = "Practice repository for JavaScript projects — from simple UI enhancements to full CRUD-based single-page applications (SPAs)."
      visibility      = "public"
      auto_init       = true
      archived        = false
      has_downloads   = true
      topics          = ["webdev", "javascript", "frontend", "practice"]
    }

    webdev_app_weather = {
      name            = "webdev-app-weather"
      description     = "Live weather forecast web app fetching real-time data from public APIs. Built using HTML, CSS, and JS, with responsive layout and sleek UI."
      visibility      = "public"
      auto_init       = true
      archived        = false
      has_downloads   = true
      topics          = ["webdev", "weather", "api", "javascript"]
    }
  }
}
