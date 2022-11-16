package com.example.bucket_list_project.entity.Board;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@NoArgsConstructor
public class ImgFile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Getter
    @Setter
    @Column(nullable = false)
    private String fileOriginalName;

    @Getter
    @Setter
    @Column(nullable = false)
    private String filePath;

    @Getter
    @Setter
    @Column(nullable = false)
    private String changeFileName;

    @Getter
    @Setter
    @OneToOne(fetch = FetchType.EAGER)
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
