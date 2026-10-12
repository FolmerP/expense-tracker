package io.github.folmerp.backend.category;

import java.time.OffsetDateTime;

public record Category(Long id, String name, OffsetDateTime createdAt) {
    
}
