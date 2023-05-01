package com.techeule.blogq.core.posts.entity;

import java.util.Set;

public record Post(String id, String title, String subtitle, String content, Set<String> tags) {
}
