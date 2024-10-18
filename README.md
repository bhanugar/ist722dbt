**Chinook Data Warehouse and Business Intelligence Solution**
=============================================

**Introduction**
-----------------
The Chinook data model represents a digital media store with various interconnected entities, such as artists, albums, tracks, invoices, and customer data. The goal of this project is to transform the Chinook dataset into a structured data warehouse that enables advanced business intelligence (BI) solutions. This transformation allows for insightful analysis of the store's operations, including customer behaviors, sales performance, and media trends.This repository contains the dimensional models for the Chinook database, implemented using dbt (Data Build Tool) and Snowflake.

Project Structure
-----------------

The project is organized as follows:

*   **models/**
    
    *   **dim\_artist.sql**: Dimension table for artists.
        
    *   **dim\_customer.sql**: Dimension table for customers.
        
    *   **dim\_customertrackreview.sql**: Dimension table for customer track reviews.
        
    *   **dim\_date.sql**: Dimension table for dates.
        
    *   **dim\_invoice.sql**: Dimension table for invoices.
        
    *   **dim\_playlist.sql**: Dimension table for playlists.
        
    *   **dim\_playlisttrack.sql**: Dimension table for playlist tracks.
        
    *   **dim\_track.sql**: Dimension table for tracks.
        
    *   **fact\_artistreleases.sql**: Fact table for artist releases.
        
    *   **fact\_playlisttracksadded.sql**: Fact table for tracks added to playlists.
        
    *   **fact\_trackreview.sql**: Fact table for track reviews.
        
    *   **fact\_tracksales.sql**: Fact table for track sales.
        
    *   **obt\_tracksales.sql**: Operational business table for track sales.
        
    *   **sources.yml**: Source configuration for dbt models.
        

### Project Details

*   **Dimensional Models**: These models transform raw data into a star schema, making it suitable for analysis.
    
*   **Surrogate Keys**: Utilized dbt\_utils to generate surrogate keys for various tables.
    
*   **Sentiment Analysis**: Incorporated sentiment analysis for customer reviews.
    
*   **Data Handling**: Managed null values and concatenated names and addresses effectively.
