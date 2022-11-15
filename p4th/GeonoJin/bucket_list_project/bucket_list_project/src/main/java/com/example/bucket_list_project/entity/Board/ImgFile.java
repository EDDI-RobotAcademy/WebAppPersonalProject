package com.example.bucket_list_project.entity.Board;


import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
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

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bucket_id")
    private BucketBoard bucket;

    public ImgFile(String fileOriginalName, String filePath, String changeFileName) {
        this.fileOriginalName = fileOriginalName;
        this.filePath = filePath;
        this.changeFileName = changeFileName;
    }

    public void setBucketBoard(BucketBoard bucketBoard) {
        this.bucket = bucketBoard;
    }
}
