package com.techeule.blogq.core.posts.entity;

import java.time.Instant;

public record PostEntity(String createdBy,
                         Instant createdAt,
                         String lastModifiedBy,
                         Instant lastModifiedAt,
                         Post post) {
}
