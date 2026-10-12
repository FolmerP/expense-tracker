package io.github.folmerp.backend.category;

import java.util.List;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryRepository {

    private final JdbcClient jdbcClient;

    public CategoryRepository(JdbcClient jdbcClient) {
        this.jdbcClient = jdbcClient;
    }


    public List<Category> findAll() {

        return jdbcClient.sql("""
                SELECT id, name, created_at
                FROM categories
                ORDER BY name
                """)
                .query(Category.class)
                .list();
    }

    public Category create(String name) {
        return jdbcClient.sql("""
                INSERT INTO categories (name)
                VALUES (:name)
                RETURNING id, name, created_at
                """)
                .param("name", name)
                .query(Category.class)
                .single();
    }
}