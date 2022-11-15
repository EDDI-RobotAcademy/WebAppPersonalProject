package com.example.bucket_list_project.entity.Board;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;


@Data
@Entity
@NoArgsConstructor
public class BucketBoard {

    @Id
    @Column(name = "bucket_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bucketId;

    @Column(nullable = false)
    private String bucketTitle;

    @Column(nullable = false)
    private String bucketContent;

    @Column(nullable = false)
    private String bucketCategory;

    @Column(nullable = false)
    private Boolean switchValue;

    @Column(nullable = false)
    private String writer;

    public BucketBoard(
            String bucketTitle, String bucketContent, String bucketCategory,
            Boolean switchValue, String writer) {
        this.bucketTitle = bucketTitle;
        this.bucketCategory = bucketCategory;
        this.bucketContent = bucketContent;
        this.switchValue = switchValue;
        this.writer = writer;
    }
}
