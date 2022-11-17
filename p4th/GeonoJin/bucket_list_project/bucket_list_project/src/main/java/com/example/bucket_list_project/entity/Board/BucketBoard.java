package com.example.bucket_list_project.entity.Board;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;


@Entity
@NoArgsConstructor
public class BucketBoard {

    @Id
    @Getter
    @Setter
    @Column(name = "bucket_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bucketId;

    @Getter
    @Setter
    @Column(nullable = false)
    private String bucketTitle;

    @Getter
    @Setter
    @Column(nullable = false)
    private String bucketContent;

    @Getter
    @Setter
    @Column(nullable = false)
    private String bucketCategory;

    @Getter
    @Setter
    @Column(nullable = false)
    private Boolean switchValue;

    @Getter
    @Setter
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

    public void modifyTitle(String bucketTitle) {
        this.bucketTitle = bucketTitle;
    }
}
