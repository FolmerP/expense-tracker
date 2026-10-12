package io.github.folmerp.backend.category;

import org.springframework.stereotype.Service;

@Service 
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository){
        this.categoryRepository = categoryRepository; 
    }

    
}
