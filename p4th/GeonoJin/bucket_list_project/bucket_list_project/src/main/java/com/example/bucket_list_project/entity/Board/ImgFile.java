package com.example.bucket_list_project.entity.Board;


import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class ImgFile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String fileOriginalName;

    @Column(nullable = false)
    private String filePath;

    @Column(nullable = false)
    private String changeFileName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bucket_id")
    private BucketBoard bucketBoard;

    public void setBucketBoard(BucketBoard bucketBoard) {
        this.bucketBoard = bucketBoard;
    }
}
